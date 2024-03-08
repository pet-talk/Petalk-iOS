import ProjectDescription

let config = Config(
    swiftVersion: "5.9.2",
    plugins: [
        .local(path: .relativeToRoot("Plugin/DependencyPlugin")),
        .local(path: .relativeToRoot("Plugin/ConfigurationPlugin")),
        .local(path: .relativeToRoot("Plugin/EnvironmentPlugin")),
        .local(path: .relativeToRoot("Plugin/TemplatePlugin"))
    ],
    generationOptions: .options(staticSideEffectsWarningTargets: .all)
)
