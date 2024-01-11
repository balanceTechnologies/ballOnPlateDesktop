import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources

    // Nodes:
    Node {
        id: rootNode
        objectName: "RootNode"
        Node {
            id: ball_on_plate
            objectName: "ball on plate"
            Node {
                id: part12_1
                objectName: "Part12-1"
                Node {
                    id: part12
                    objectName: "Part12"
                    Model {
                        id: model
                        source: "meshes/node6.mesh"
                        materials: [
                            alt_material
                        ]
                    }
                    Model {
                        id: model8
                        source: "meshes/node9.mesh"
                        materials: [
                            material_2_material
                        ]
                    }
                }
            }
            Node {
                id: universal_Joint_1
                objectName: "Universal Joint-1"
                x: -2.42861286636753e-15
                y: 11.199999809265137
                z: -1.734723475976807e-16
                Node {
                    id: universal_Joint
                    objectName: "Universal Joint"
                    Node {
                        id: hylsa_1
                        objectName: "hylsa-1"
                        Model {
                            id: hylsa
                            objectName: "hylsa"
                            source: "meshes/hylsa_mesh.mesh"
                            materials: [
                                material_3_material
                            ]
                        }
                    }
                    Node {
                        id: hylsa2_1
                        objectName: "hylsa2-1"
                        x: 5.421010862427522e-17
                        y: 5.935999870300293
                        z: 1.8214596497756474e-15
                        rotation: Qt.quaternion(3.09086e-08, -0.707107, 3.09086e-08, 0.707107)
                        Model {
                            id: hylsa2
                            objectName: "hylsa2"
                            source: "meshes/hylsa2_mesh.mesh"
                            materials: [
                                material_3_material
                            ]
                        }
                    }
                    Node {
                        id: univ_1
                        objectName: "univ-1"
                        x: 7.589415207398531e-16
                        y: 1.9830000400543213
                        z: 3.470100755509776e-16
                        Model {
                            id: univ
                            objectName: "univ"
                            source: "meshes/univ_mesh.mesh"
                            materials: [
                                material_4_material
                            ]
                        }
                    }
                    Node {
                        id: joint_rod_2
                        objectName: "joint rod-2"
                        rotation: Qt.quaternion(0.707107, 0, 0.707107, 0)
                        Model {
                            id: joint_rod
                            objectName: "joint rod"
                            source: "meshes/joint_rod_mesh.mesh"
                            materials: [
                                material_5_material
                            ]
                        }
                    }
                }
            }
            Node {
                id: part111_1
                objectName: "Part111-1"
                x: -2.2305917739868164
                y: 17.736000061035156
                z: 4.380738735198975
                property real tiltX: 0 // x-tilt
                property real tiltY: 0 // y-tilt



               /* Model {
                    rotation: Qt.quaternion(0.707107, tiltX, 0.707107, tiltY)
                    id: part111
                    objectName: "Part111"
                    source: "meshes/part111_mesh.mesh"
                    materials: üst_material
                }*/
                Component.onCompleted: {
                    Communication.plate = part111_1
                }

            }
            Node {
                id: servoo_1
                objectName: "servoo-1"
                x: 9.10853099822998
                y: 3.612168788909912
                z: -2.903536081314087
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                Node {
                    id: servoo
                    objectName: "servoo"
                    Node {
                        id: servo_1
                        objectName: "servo-1"
                        x: -0.7607599496841431
                        y: -1.825463891029358
                        z: -0.1426083743572235
                        Model {
                            id: servo
                            objectName: "servo"
                            source: "meshes/servo_mesh.mesh"
                            materials: [
                                material_6_material
                            ]
                        }
                    }
                    Node {
                        id: servo2_1
                        objectName: "servo2-1"
                        x: -1.508530616760254
                        y: 0.9745360612869263
                        z: 0.11216869950294495
                        rotation: Qt.quaternion(0.0339087, -4.51684e-08, 0.999425, 4.51684e-08)
                        Model {
                            id: servo2
                            objectName: "servo2"
                            source: "meshes/servo2_mesh.mesh"
                            materials: [
                                material_7_material
                            ]
                        }
                    }
                }
            }
            Node {
                id: servoo_2
                objectName: "servoo-2"
                x: -2.903536081314087
                y: 3.612168788909912
                z: -12.526530265808105
                rotation: Qt.quaternion(-0.5, -0.5, -0.5, 0.5)
                Node {
                    id: servoo42
                    objectName: "servoo"
                    Node {
                        id: servo_143
                        objectName: "servo-1"
                        x: -0.7607599496841431
                        y: -1.825463891029358
                        z: -0.1426083743572235
                        Model {
                            id: servo44
                            objectName: "servo"
                            source: "meshes/servo_mesh.mesh"
                            materials: [
                                material_6_material
                            ]
                        }
                    }
                    Node {
                        id: servo2_145
                        objectName: "servo2-1"
                        x: -1.508530616760254
                        y: 0.9745360612869263
                        z: 0.11216869950294495
                        rotation: Qt.quaternion(0.0339087, -4.51684e-08, 0.999425, 4.51684e-08)
                        Model {
                            id: servo246
                            objectName: "servo2"
                            source: "meshes/servo2_mesh.mesh"
                            materials: [
                                material_7_material
                            ]
                        }
                    }
                }
            }
            Node {
                id: heim_joint_1
                objectName: "Heim joint-1"
                x: 7.347167491912842
                y: 17.29736328125
                z: -0.7305840849876404
                rotation: Qt.quaternion(0.508597, 0.491253, -0.508597, 0.491253)
                scale.x: 1
                scale.y: 1
                scale.z: 1
                Node {
                    id: heim_joint
                    objectName: "Heim joint"
                    Node {
                        id: heim_Joint_bearing_1
                        objectName: "Heim Joint bearing-1"
                        x: 0.6905062794685364
                        y: 1.325066089630127
                        z: 1.2080464363098145
                        Model {
                            id: heim_Joint_bearing
                            objectName: "Heim Joint bearing"
                            source: "meshes/heim_Joint_bearing_mesh.mesh"
                            materials: [
                                material_8_material
                            ]
                        }
                    }
                    Node {
                        id: heim_joint_hold_2
                        objectName: "Heim joint hold-2"
                        x: 1.15109121799469
                        y: 1.325066089630127
                        z: 1.2080464363098145
                        rotation: Qt.quaternion(0.707, 0.0122641, -0.0122641, 0.707)
                        scale.x: 1
                        scale.y: 1
                        scale.z: 1
                        Model {
                            id: heim_joint_hold
                            objectName: "Heim joint hold"
                            source: "meshes/heim_joint_hold_mesh.mesh"
                            materials: [
                                material_7_material
                            ]
                        }
                    }
                    Node {
                        id: heim_Joint_Eye_ball_1
                        objectName: "Heim Joint Eye ball-1"
                        x: 0.6905062794685364
                        y: 1.325066089630127
                        z: 1.2080464363098145
                        rotation: Qt.quaternion(0.700492, -0.0964912, 0.0964912, 0.700492)
                        Model {
                            id: heim_Joint_Eye_ball
                            objectName: "Heim Joint Eye ball"
                            source: "meshes/heim_Joint_Eye_ball_mesh.mesh"
                            materials: [
                                material_7_material
                            ]
                        }
                    }
                }
            }
            Node {
                id: heim_joint_2
                objectName: "Heim joint-2"
                x: -0.6884284615516663
                y: 14.810934066772461
                z: -10.727046012878418
                Node {
                    id: heim_joint60
                    objectName: "Heim joint"
                    Node {
                        id: heim_Joint_bearing_161
                        objectName: "Heim Joint bearing-1"
                        x: 0.6905062794685364
                        y: 1.325066089630127
                        z: 1.2080464363098145
                        Model {
                            id: heim_Joint_bearing62
                            objectName: "Heim Joint bearing"
                            source: "meshes/heim_Joint_bearing_mesh.mesh"
                            materials: [
                                material_8_material
                            ]
                        }
                    }
                    Node {
                        id: heim_joint_hold_263
                        objectName: "Heim joint hold-2"
                        x: 1.15109121799469
                        y: 1.325066089630127
                        z: 1.2080464363098145
                        rotation: Qt.quaternion(0.707, 0.0122641, -0.0122641, 0.707)
                        scale.x: 1
                        scale.y: 1
                        scale.z: 1
                        Model {
                            id: heim_joint_hold64
                            objectName: "Heim joint hold"
                            source: "meshes/heim_joint_hold_mesh.mesh"
                            materials: [
                                material_7_material
                            ]
                        }
                    }
                    Node {
                        id: heim_Joint_Eye_ball_165
                        objectName: "Heim Joint Eye ball-1"
                        x: 0.6905062794685364
                        y: 1.325066089630127
                        z: 1.2080464363098145
                        rotation: Qt.quaternion(0.700492, -0.0964912, 0.0964912, 0.700492)
                        Model {
                            id: heim_Joint_Eye_ball66
                            objectName: "Heim Joint Eye ball"
                            source: "meshes/heim_Joint_Eye_ball_mesh.mesh"
                            materials: [
                                material_7_material
                            ]
                        }
                    }
                }
            }
            Node {
                id: servo_rodd_1
                objectName: "servo rodd-1"
                x: 5.980999946594238
                y: 2.8674306869506836
                z: -0.07949293404817581
                Model {
                    id: servo_rodd
                    objectName: "servo rodd"
                    source: "meshes/servo_rodd_mesh.mesh"
                    materials: [
                        material_9_material
                    ]
                }
            }
            Node {
                id: servo_rodd_2
                objectName: "servo rodd-2"
                x: -0.0373372957110405
                y: 2.8674306869506836
                z: -9.519000053405762
                rotation: Qt.quaternion(0.707107, 0, 0.707107, 0)
                Model {
                    id: servo_rodd72
                    objectName: "servo rodd"
                    source: "meshes/servo_rodd_mesh.mesh"
                    materials: [
                        material_9_material
                    ]
                }
            }
            Node {
                id: partface_1
                objectName: "Partface-1"
                x: -0.01899999938905239
                y: 18.035999298095703
                z: -0.01899999938905239

                Model {
                     rotation: Qt.quaternion(0.707107, part111_1.tiltX, -0.707107, part111_1.tiltY)
                    id: partface
                    objectName: "Partface"
                    source: "meshes/partface_mesh.mesh"
                    materials: [
                        material_1_material
                    ]
                }
            }
            Node {
                id: screen_1
                objectName: "screen-1"
                x: -0.01899999938905239
                y: 18.035999298095703
                z: -0.01899999938905239

                Model {
                    rotation: Qt.quaternion(0.707107, part111_1.tiltX, -0.707107, part111_1.tiltY)
                    id: screen
                    objectName: "screen"
                    source: "meshes/screen_mesh.mesh"
                    materials: [
                        material_10_material
                    ]
                }
            }
            Node {
                id: spring_pin_slotted_ld_iso_1
                objectName: "spring pin slotted_ld_iso-1"
                x: 5.980999946594238
                y: 3.442178726196289
                z: -0.5294929146766663
                rotation: Qt.quaternion(0.707107, 7.27818e-06, -0.707107, 7.27818e-06)
                Model {
                    id: spring_pin_slotted_ld_iso
                    objectName: "spring pin slotted_ld_iso"
                    source: "meshes/spring_pin_slotted_ld_iso_mesh.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: spring_pin_slotted_ld_iso_2
                objectName: "spring pin slotted_ld_iso-2"
                x: -0.48733729124069214
                y: 3.442178726196289
                z: -9.519000053405762
                rotation: Qt.quaternion(1, 8.74546e-06, 0, 0)
                Model {
                    id: spring_pin_slotted_ld_iso85
                    objectName: "spring pin slotted_ld_iso"
                    source: "meshes/spring_pin_slotted_ld_iso_mesh.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: spring_pin_slotted_ld_iso_3
                objectName: "spring pin slotted_ld_iso-3"
                x: 5.980999946594238
                y: 16.13599967956543
                z: 1.2599999904632568
                rotation: Qt.quaternion(0.707107, 0, 0.707107, 0)
                Model {
                    id: spring_pin_slotted_ld_iso87
                    objectName: "spring pin slotted_ld_iso"
                    source: "meshes/spring_pin_slotted_ld_iso_mesh88.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: spring_pin_slotted_ld_iso_4
                objectName: "spring pin slotted_ld_iso-4"
                x: 0.7731556296348572
                y: 16.13599967956543
                z: -9.519000053405762
                rotation: Qt.quaternion(-2.43002e-08, 3.63344e-08, 0.831234, -0.555923)
                Model {
                    id: spring_pin_slotted_ld_iso90
                    objectName: "spring pin slotted_ld_iso"
                    source: "meshes/spring_pin_slotted_ld_iso_mesh88.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: pan_head_cross_recess_screw_iso_1
                objectName: "pan head cross recess screw_iso-1"
                x: 5.980999946594238
                y: 16.13599967956543
                z: 1.8600000143051147
                rotation: Qt.quaternion(0.0101118, -0.707034, 0.0101118, 0.707034)
                Model {
                    id: pan_head_cross_recess_screw_iso
                    objectName: "pan head cross recess screw_iso"
                    source: "meshes/pan_head_cross_recess_screw_iso_mesh.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: pan_head_cross_recess_screw_iso_5
                objectName: "pan head cross recess screw_iso-5"
                x: -1.826844334602356
                y: 16.13599967956543
                z: -9.519000053405762
                rotation: Qt.quaternion(0.321581, 0.946882, 0, 0)
                Model {
                    id: pan_head_cross_recess_screw_iso95
                    objectName: "pan head cross recess screw_iso"
                    source: "meshes/pan_head_cross_recess_screw_iso_mesh.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: pan_head_cross_recess_screw_iso_7
                objectName: "pan head cross recess screw_iso-7"
                x: 5.980999946594238
                y: 3.442178726196289
                z: 0.38050708174705505
                rotation: Qt.quaternion(0.704929, 0.0554533, 0.704929, -0.0554533)
                Model {
                    id: pan_head_cross_recess_screw_iso97
                    objectName: "pan head cross recess screw_iso"
                    source: "meshes/pan_head_cross_recess_screw_iso_mesh98.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: pan_head_cross_recess_screw_iso_8
                objectName: "pan head cross recess screw_iso-8"
                x: 0.4226627051830292
                y: 3.442178726196289
                z: -9.519000053405762
                rotation: Qt.quaternion(-2.89099e-09, -4.36157e-08, 0.99781, 0.0661382)
                Model {
                    id: pan_head_cross_recess_screw_iso100
                    objectName: "pan head cross recess screw_iso"
                    source: "meshes/pan_head_cross_recess_screw_iso_mesh98.mesh"
                    materials: [
                        material_11_material
                    ]
                }
            }
            Node {
                id: ball_1
                objectName: "ball-1"
                x: -0.10715102404356003
                y: 19.236000061035156
                z: -0.740764319896698

                Component.onCompleted: {
                    Communication.ball = ball_1
                }

                Model {
                    id: ball
                    objectName: "ball"
                    source: "meshes/ball_mesh.mesh"
                    materials: [
                        material_4_material
                    ]
                }
            }
        }
    }

    Node {
        id: __materialLibrary__

        PrincipledMaterial {
            id: material_1_material
            baseColor: "#ffffff"
            objectName: "Material_1"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: üst_material
            baseColor: "#ffffff"
            objectName: "Üst"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: alt_material
            baseColor: "#b8c7cf"
            objectName: "Alt"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_2_material
            objectName: "Material_2"
            baseColor: "#ffcbd2ef"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_3_material
            objectName: "Material_3"
            baseColor: "#ffa3aaad"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_4_material
            objectName: "Material_4"
            baseColor: "#ffc6c1bc"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_5_material
            objectName: "Material_5"
            baseColor: "#ffe5e5e5"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_6_material
            objectName: "Material_6"
            baseColor: "#ff000080"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_7_material
            objectName: "Material_7"
            baseColor: "#ffcad1ee"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_8_material
            objectName: "Material_8"
            baseColor: "#ffffff00"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_9_material
            objectName: "Material_9"
            baseColor: "#ff023dd2"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_10_material
            objectName: "Material_10"
            baseColor: "#fff0f5f7"
            roughness: 0.5527864098548889
        }

        PrincipledMaterial {
            id: material_11_material
            objectName: "Material_11"
            baseColor: "#323232"
            roughness: 0.5527864098548889
        }
    }

    // Animations:
}
