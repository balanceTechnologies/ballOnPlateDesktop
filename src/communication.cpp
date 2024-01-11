#include "communication.h"

Communication::Communication(QObject *parent)
    : QObject{parent}
{
    TCPSocket = new QTcpSocket();
    TCPSocket->connectToHost("10.1.254.146", 8080);//10.1.244.58
    TCPSocket->write("CONNECT_DESKTOP");
    connect(TCPSocket,SIGNAL(readyRead()),this,SLOT(readFromServer()));
}

void Communication::readFromServer()
{
    if(TCPSocket){
        if(TCPSocket->isOpen()){
            QByteArray data_from_server = TCPSocket->readAll();
            QString message_string = QString::fromStdString(data_from_server.toStdString());

            // Split the received data by newline delimiter
            QStringList messages = message_string.split("\n", Qt::SkipEmptyParts);

            for (const QString &message : messages) {
                QStringList parts = message.split(" ");

                if(parts.size() == 3 && parts[0] == "COORD") {
                    QString x_str = parts[1];
                    QString y_str = parts[2];

                    // Convert QString to double for mapping
                    bool xConversionOK, yConversionOK;
                    double received_x = x_str.toDouble(&xConversionOK);
                    double received_y = y_str.toDouble(&yConversionOK);

                    if (xConversionOK && yConversionOK) {
                        // Map received x and y values to new ranges
                        double mapped_x = map(received_x, 0, 300, -7, 7);
                        double mapped_y = map(received_y, 0, 400, -10, 10);

                        // Convert mapped values back to QString if needed
                        QString mapped_x_str = QString::number(mapped_x);
                        QString mapped_y_str = QString::number(mapped_y);

                        // Set the properties for ball using the mapped values
                        ball->setProperty("x", mapped_x_str);
                        ball->setProperty("z", mapped_y_str);

                        //tilt the plate according to the ball's distance from the center
                        double tilt_x=map(mapped_x, -7, 7, -0.2, 0.2);
                        double tilt_y=map(mapped_y, -10, 10, -0.2, 0.2);

                        //Change the y value of the ball depending on which side rises more
                        double abs_tilt_x = std::abs(mapped_x);
                        double abs_tilt_y = std::abs(mapped_y);
                        double larger_tilt = (abs_tilt_x > abs_tilt_y) ? abs_tilt_x : abs_tilt_y;
                        double mapped_z = map(larger_tilt, 0, 10, 19.1, 21);
                        QString mapped_z_str = QString::number(mapped_z);
                        qDebug() <<larger_tilt << "Mapped z =" << mapped_z_str;
                        //
                        if(mapped_x == 0 && mapped_y == 0 ){
                            qDebug() << "1"<< tilt_x;
                            plate->setProperty("tiltX", 0);
                            plate->setProperty("tiltY", 0);
                            ball->setProperty("y", mapped_z_str);
                        }
                        else {
                            qDebug() << "2"<< tilt_x;
                            plate->setProperty("tiltX", tilt_x);
                            plate->setProperty("tiltY", tilt_y);
                            ball->setProperty("y", mapped_z_str);
                        }
                 /*       else if(mapped_x>=0 && mapped_y>=0 ){
                            qDebug() << "2"<< tilt_x;
                            plate->setProperty("tiltX", tilt_x);
                            plate->setProperty("tiltY", tilt_y);
                            ball->setProperty("y", mapped_z_str);
                        }
                        else if(mapped_x<=0 && mapped_y>=0){
                            qDebug() << "2"<< tilt_x;
                            plate->setProperty("tiltX", tilt_x);
                            plate->setProperty("tiltY", tilt_y);
                            ball->setProperty("y", mapped_z_str);
                        }
                        else if(mapped_x>=0 && mapped_y<=0){
                            qDebug() << "3"<< tilt_x;
                            plate->setProperty("tiltX", tilt_x);
                            plate->setProperty("tiltY", tilt_y);
                            ball->setProperty("y", mapped_z_str);
                        }
                        else if(mapped_x<=0 && mapped_y<=0){
                            qDebug() << "4"<< tilt_x;
                            plate->setProperty("tiltX", tilt_x);
                            plate->setProperty("tiltY", tilt_y);
                            ball->setProperty("y", mapped_z_str);
                        }*/
                        qDebug() << "Mapped x =" << mapped_x_str;
                        qDebug() << "Mapped y =" << mapped_y_str;
                    }

                    else {
                        qDebug() << "Failed to convert x and/or y to double";
                    }

                    setrect_X(map(received_x,0,300,0,330));
                    setrect_Y(map(received_y,0,400,0,250));

            }
                else if (parts.size() == 3&& parts[0] == "SET_BALANCE_COORD") {
                    QString commandX_str = parts[1];
                    QString commandY_str = parts[2];
                 /*   if (moveCommand == "MOVE_LEFT"){
                        setCommand("Left Command");
                    }
                    else if (moveCommand == "MOVE_RIGHT"){
                        setCommand("Right Command");
                    }
                    else if (moveCommand == "MOVE_FORWARD"){
                        setCommand("Forward Command");
                    }
                    else if (moveCommand == "MOVE_BACKWARD"){
                        setCommand("Backward Command");
                    }*/
                }
        }
    }
    }}


double Communication::map(double value, double in_min, double in_max, double out_min, double out_max) {
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void Communication::sendDirection(int c)
{
    QString movementString="MOVE_";
    if(TCPSocket){
        if(TCPSocket->isOpen()){
            switch(c) {
            case 5:
                movementString+="FORWARD\n";
                qInfo() << movementString;
                TCPSocket->write(movementString.toStdString().c_str());
                break;

            case 1:
                movementString+="LEFT\n";
                TCPSocket->write(movementString.toStdString().c_str());
                break;

            case 2:
                movementString+="BACKWARD\n";
                TCPSocket->write(movementString.toStdString().c_str());
                break;

            case 3:
                movementString+="RIGHT\n";
                TCPSocket->write(movementString.toStdString().c_str());
                break;

            default:

                break;
            }
        }
    }
}

void Communication::sendLocation(int x, int y)
{
    QString movementString="SET_BALANCE_COORD ";
    int mapped_x = map(x, -165, 165, 0, 300);
    int mapped_y = map(y, -125, 125, 0, 400);


    if(TCPSocket){
        if(TCPSocket->isOpen()){
            movementString += QString::number(mapped_x) + " " + QString::number(mapped_y)+"\n";
            TCPSocket->write(movementString.toStdString().c_str());
        }
        else{
            qDebug() << "Error,socket not open";
        }

    }
}

QObject *Communication::getBall()
{
    return ball;
}


void Communication::setBall(QObject *object)
{

    if (ball != object) {
        ball = object;

    }
}

QObject *Communication::getPlate()
{
    return plate;
}

void Communication::setPlate(QObject *object)
{
    if (plate != object) {
        plate = object;

    }
}

double Communication::rect_X()
{
    return m_rect_X;
}

double Communication::rect_Y()
{
    return m_rect_Y;
}

void Communication::setrect_X(double newRect_X)
{
    if (m_rect_X!=newRect_X){
        m_rect_X = newRect_X;
        emit rect_XChanged();
    }
}

void Communication::setrect_Y(double newRect_Y)
{
    if (m_rect_Y!=newRect_Y){
        m_rect_Y = newRect_Y;
        emit rect_YChanged();
    }
}



QString Communication::command() const
{
    return m_command;
}

void Communication::setCommand(const QString &newCommand)
{

    m_command = newCommand;
    emit commandChanged();
}
