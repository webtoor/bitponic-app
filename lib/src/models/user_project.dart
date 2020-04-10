/* 
userProjectFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<UserProject>.from(jsonData.map((x) => UserProject.fromJson(x)));
}  */

class UserProject {
  int id;
  String projectName;
  String projectType;
  List<ProjectDevice> projectDevice;

  UserProject({
    this.id,
    this.projectName,
    this.projectType,
    this.projectDevice,
  });

  factory UserProject.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson["data"]["project_device"] as List;
    //print(list);
    List<ProjectDevice> dataList =
        list.map((i) => ProjectDevice.fromJson(i)).toList();

    return UserProject(
      id: parsedJson["data"]["id"],
      projectName: parsedJson["data"]["project_name"],
      projectType: parsedJson["data"]["project"]["name"],
      projectDevice: dataList,
    );
  }
}

class ProjectDevice {
  int id;
  int userProjectId;
  int deviceId;
  String key;

  ProjectDevice({
    this.id,
    this.userProjectId,
    this.deviceId,
    this.key,
  });

  factory ProjectDevice.fromJson(Map<String, dynamic> parsedJson) =>
      new ProjectDevice(
        id: parsedJson["id"],
        userProjectId: parsedJson["user_project_id"],
        deviceId: parsedJson["device_id"],
        key: parsedJson["key"],
      );
}
