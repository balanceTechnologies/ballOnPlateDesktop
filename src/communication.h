#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QObject>
#include <QtNetwork/QTcpSocket>
#include <QtNetwork/QHostAddress>
#include <QDebug>
#include <QString>
#include <QByteArray>
#include <QShortcut>
#include <QKeySequence>

class Communication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject* ball READ getBall WRITE setBall   NOTIFY ballChanged)
    Q_PROPERTY(QObject* plate READ getPlate WRITE setPlate  NOTIFY plateChanged)
    Q_PROPERTY(double rect_X READ rect_X WRITE setrect_X NOTIFY rect_XChanged)
    Q_PROPERTY(double rect_Y READ rect_Y WRITE setrect_Y NOTIFY rect_YChanged)
    Q_PROPERTY(double command_X READ command_X WRITE setCommand_X NOTIFY command_XChanged )
    Q_PROPERTY(double command_Y READ command_Y WRITE setCommand_Y NOTIFY command_YChanged )
public:
    explicit Communication(QObject *parent = nullptr);

    QObject *getBall();
    void setBall(QObject *object);
    QObject* ball;

    QObject *getPlate();
    void setPlate(QObject *object);
    QObject* plate;

    double rect_X();
    double rect_Y();



    double command_X() const;
    void setCommand_X(double newCommand_X);

    double command_Y() const;
    void setCommand_Y(double newCommand_Y);


public slots:
    bool connectServer(QString ipWithPort);
    void sendDirection(int c);
    void sendLocation(int x, int y);
    void readFromServer();
    void setrect_X(double newRect_X);
    void setrect_Y(double newRect_Y);
    double map(double value, double in_min, double in_max, double out_min, double out_max);
signals:
    void ballChanged();
    void plateChanged();
    void rect_XChanged();
    void rect_YChanged();




    void command_XChanged();

    void command_YChanged();

private:
    QTcpSocket *TCPSocket;
    double m_rect_X=0;
    double m_rect_Y=0;

    double m_command_X;
    double m_command_Y;
};

#endif // COMMUNICATION_H
