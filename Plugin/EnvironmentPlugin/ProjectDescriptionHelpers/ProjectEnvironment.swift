import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let destinations: Destinations
    public let deploymentTargets: DeploymentTargets
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "petalk-ios",
    organizationName: "Petalk-Project",
    destinations: [.iPhone, .iPad],
    deploymentTargets: .iOS("15.0"),
    baseSetting: [:]
)
