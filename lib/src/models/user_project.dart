
import 'dart:convert';

List<UserProject> userProjectFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<UserProject>.from(jsonData.map((x) => UserProject.fromJson(x)));
}

class UserProject {
    String id;
    String projectName;
    String commodity;

    UserProject({
        this.id,
        this.projectName,
        this.commodity,
    });

    factory UserProject.fromJson(Map<String, dynamic> json) => new UserProject(
        id: json["id"],
        projectName: json["project_name"],
        commodity: json["commodity"],
    );

}