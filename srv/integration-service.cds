// Namespace for the IntegrationSuiteNotifier CAP project
namespace IntegrationSuiteNotifier;

// Entity representing integration runtime artifacts
entity IntegrationRuntimeArtifacts {
    key ID : UUID;                // Unique identifier
    Name  : String(100);         // Name of the artifact
    Type  : String(50);          // Type of the artifact
    Status: String(30);          // Status (e.g., Active, Inactive)
    LastModifiedAt: Timestamp;   // Last modification timestamp
}

// Service exposing the IntegrationRuntimeArtifacts collection
service IntegrationService {
    entity IntegrationRuntimeArtifacts as projection on IntegrationSuiteNotifier.IntegrationRuntimeArtifacts;
}
