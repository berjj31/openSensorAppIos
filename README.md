Simple framework for developing sensor application on iOS

# How to use

1. build
2. look and feel

![standby](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/standby.jpg)
![sensoractionlist](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/sensoractionlist.jpg)
![selectsensor](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/selectsensor.jpg)
![sensorsetting](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/sensorsetting.jpg)
![selectaction](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/selectaction.jpg)
![actionsetting](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/actionsetting.jpg)
![savesensoraction](https://raw.githubusercontent.com/oubakiou/openSensorAppIos/master/readmeImages/savesensoraction.jpg)

# How create new sensor

1. Add new sensor name to [sensorNameList.plist](https://github.com/oubakiou/openSensorAppIos/blob/master/sensorNameList.plist)
2. write [sensor class](https://github.com/oubakiou/openSensorAppIos/blob/master/openSensorApp/Sensor/Proximity.swift) and [sensorSettingViewController](https://github.com/oubakiou/openSensorAppIos/blob/master/openSensorApp/Sensor/ProximitySettingViewController.swift),xib

# How create new action

1. Add new action name to [actionNameList.plist](https://github.com/oubakiou/openSensorAppIos/blob/master/actionNameList.plist)
2. write [action class](https://github.com/oubakiou/openSensorAppIos/blob/master/openSensorApp/Action/OpenUrl.swift) and [actionSettingViewController](https://github.com/oubakiou/openSensorAppIos/blob/master/openSensorApp/Action/OpenUrlSettingViewController.swift),xib
