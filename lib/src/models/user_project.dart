
/* import 'dart:convert';

userProjectFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<UserProject>.from(jsonData.map((x) => UserProject.fromJson(x)));
}  */

class UserProject {
    int id;
    String projectName;
    String projectType;

    UserProject({
        this.id,
        this.projectName,
        this.projectType,
    });

    factory UserProject.fromJson(Map<String, dynamic> json) => new UserProject(
        id: json["data"]["id"],
        projectName: json["data"]["project_name"],
        projectType: json["data"]["project"]["name"],
    );

}