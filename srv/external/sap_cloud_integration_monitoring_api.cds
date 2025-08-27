/* checksum : c8055541e36f7eb90de532f2cd5352b8 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
service sap_cloud_integration_monitoring_api {
  @cds.external : true
  @cds.persistence.skip : true
  entity BusinessDocumentNotes {
    key Id : LargeString not null;
    UserId : LargeString;
    @odata.Type : 'Edm.DateTime'
    CreateTimeStamp : DateTime;
    Text : LargeString;
    Type : LargeString;
    BusinessDocumentProcessingEvent : Association to BusinessDocumentProcessingEvents {  };
    BusinessDocument : Association to BusinessDocuments {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BusinessDocumentProcessingEvents {
    key Id : LargeString not null;
    EventType : LargeString;
    @odata.Type : 'Edm.DateTime'
    Date : DateTime;
    MonitoringType : LargeString;
    MonitoringId : LargeString;
    BusinessDocument : Association to BusinessDocuments {  };
    FunctionalAcknowledgement : Association to FunctionalAcknowledgements {  };
    BusinessDocumentPayload : Association to many BusinessDocumentPayloads {  };
    ErrorDetails : Association to many ErrorDetails {  };
    BusinessDocumentNotes : Association to many BusinessDocumentNotes {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity B2BArchivingKeyPerformanceIndicators {
    @odata.Type : 'Edm.DateTime'
    key RunStart : DateTime not null;
    RunDurationInMinutes : Integer;
    DataCollectionDurationInMinutes : Integer;
    DataCompressionDurationInMinutes : Integer;
    DataUploadDurationInMinutes : Integer;
    DocumentsToBeArchived : Integer;
    DocumentsArchived : Integer;
    DocumentsArchivingFailed : Integer;
    @odata.Type : 'Edm.DateTime'
    DocumentsArchivedUntilDate : DateTime;
    @odata.Type : 'Edm.DateTime'
    DateOfOldestDocumentToBeArchivedAfterRun : DateTime;
    DataUploadedInMb : Integer;
    RunStatus : LargeString;
    RunFailedPhase : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity OrphanedInterchanges {
    key Id : LargeString not null;
    AdapterType : LargeString;
    MonitoringType : LargeString;
    MonitoringId : LargeString;
    @odata.Type : 'Edm.DateTime'
    Date : DateTime;
    PayloadId : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    CommunicationProtocolHeaders : Association to many CommunicationProtocolHeaders {  };
    ErrorDetails : Association to ErrorDetails {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity TechnicalAcknowledgements {
    key Id : LargeString not null;
    Type : LargeString;
    Direction : LargeString;
    PayloadId : LargeString;
    Status : LargeString;
    PayloadContainerContentType : LargeString;
    PayloadContentType : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    BusinessDocumentProcessingEvent : Association to BusinessDocumentProcessingEvents {  };
    BusinessDocument : Association to BusinessDocuments {  };
    FunctionalAcknowledgement : Association to FunctionalAcknowledgements {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CommunicationProtocolHeaders {
    key Id : LargeString not null;
    Name : LargeString;
    Value : LargeString;
    OrphanedInterchange : Association to OrphanedInterchanges {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity FunctionalAcknowledgements {
    key Id : LargeString not null;
    PayloadId : LargeString;
    PayloadContainerContentType : LargeString;
    PayloadContentType : LargeString;
    DocumentId : LargeString;
    MessageType : LargeString;
    DocumentStandard : LargeString;
    Direction : LargeString;
    Status : LargeString;
    TransmissionStatus : LargeString;
    TransmissionErrorInformation : LargeString;
    TransmissionHttpCode : Integer;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    BusinessDocumentProcessingEvents : Association to many BusinessDocumentProcessingEvents {  };
    BusinessDocument : Association to BusinessDocuments {  };
    TechnicalAcknowledgement : Association to TechnicalAcknowledgements {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BusinessDocumentPayloads {
    key Id : LargeString not null;
    ProcessingState : LargeString;
    Direction : LargeString;
    PayloadId : LargeString;
    PayloadContainerContentType : LargeString;
    PayloadContentType : LargeString;
    ArchivingRelevant : Boolean;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    BusinessDocumentProcessingEvent : Association to BusinessDocumentProcessingEvents {  };
    BusinessDocument : Association to BusinessDocuments {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BusinessDocumentProtocolHeaders {
    key Id : LargeString not null;
    Name : LargeString;
    Value : LargeString;
    BusinessDocument : Association to BusinessDocuments {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BusinessDocumentRelations {
    key SourceDocumentId : LargeString not null;
    key TargetDocumentId : LargeString not null;
    Type : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ErrorDetails {
    key Id : LargeString not null;
    ErrorInformation : LargeString;
    ErrorCategory : LargeString;
    IsTransientError : Boolean;
    BusinessDocumentProcessingEvent : Association to BusinessDocumentProcessingEvents {  };
    OrphanedInterchange : Association to OrphanedInterchanges {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BusinessDocuments {
    key Id : LargeString not null;
    SenderMessageType : LargeString;
    SenderGroupControlNumber : LargeString;
    SenderDocumentStandard : LargeString;
    SenderInterchangeControlNumber : LargeString;
    SenderMessageNumber : LargeString;
    SenderTradingPartnerName : LargeString;
    SenderSystemId : LargeString;
    SenderAdapterType : LargeString;
    SenderCommunicationPartnerName : LargeString;
    ReceiverMessageType : LargeString;
    ReceiverGroupControlNumber : LargeString;
    ReceiverDocumentStandard : LargeString;
    ReceiverInterchangeControlNumber : LargeString;
    ReceiverMessageNumber : LargeString;
    ReceiverSystemId : LargeString;
    ReceiverAdapterType : LargeString;
    ReceiverTradingPartnerName : LargeString;
    ReceiverCommunicationPartnerName : LargeString;
    AgreedSenderIdentiferAtSenderSide : LargeString;
    AgreedSenderIdentiferQualifierAtSenderSide : LargeString;
    AgreedReceiverIdentiferAtSenderSide : LargeString;
    AgreedReceiverIdentiferQualifierAtSenderSide : LargeString;
    AgreedSenderIdentiferAtReceiverSide : LargeString;
    AgreedSenderIdentiferQualifierAtReceiverSide : LargeString;
    AgreedReceiverIdentiferAtReceiverSide : LargeString;
    AgreedReceiverIdentiferQualifierAtReceiverSide : LargeString;
    Bulk : Boolean;
    TransactionDocumentType : LargeString;
    ProcessingStatus : LargeString;
    ReceiverFunctionalAckStatus : LargeString;
    ReceiverTechnicalAckStatus : LargeString;
    OverallStatus : LargeString;
    @odata.Type : 'Edm.DateTime'
    StartedAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    EndedAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    DocumentCreationTime : DateTime;
    @odata.Type : 'Edm.DateTime'
    TechnicalAckDueTime : DateTime;
    @odata.Type : 'Edm.DateTime'
    FunctionalAckDueTime : DateTime;
    ResendAllowed : Boolean;
    RetryAllowed : Boolean;
    AgreementTypeName : LargeString;
    TransactionTypeName : LargeString;
    ArchivingStatus : LargeString;
    InterchangeName : LargeString;
    InterchangeDirection : LargeString;
    TransactionActivityType : LargeString;
    BusinessDocumentRelations : Association to many BusinessDocumentRelations {  };
    BusinessDocumentProcessingEvents : Association to many BusinessDocumentProcessingEvents {  };
    BusinessDocumentPayloads : Association to many BusinessDocumentPayloads {  };
    SenderTechnicalAcknowledgement : Association to TechnicalAcknowledgements {  };
    ReceiverTechnicalAcknowledgement : Association to TechnicalAcknowledgements {  };
    SenderFunctionalAcknowledgement : Association to FunctionalAcknowledgements {  };
    ReceiverFunctionalAcknowledgement : Association to FunctionalAcknowledgements {  };
    LastErrorDetails : Association to ErrorDetails {  };
    CustomObjects : Association to CustomObjects {  };
    BusinessDocumentNotes : Association to many BusinessDocumentNotes {  };
    BusinessDocumentProtocolHeaders : Association to many BusinessDocumentProtocolHeaders {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity B2BArchivingConfigurations {
    key Id : LargeString not null;
    Active : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CustomObjects {
    key Id : LargeString not null;
    SearchFieldValue1 : LargeString;
    SearchFieldValue2 : LargeString;
    SearchFieldValue3 : LargeString;
    SearchFieldValue4 : LargeString;
    SearchFieldValue5 : LargeString;
    SearchFieldValue6 : LargeString;
    SearchFieldValue7 : LargeString;
    SearchFieldValue8 : LargeString;
    SearchFieldValue9 : LargeString;
    SearchFieldValue10 : LargeString;
    BusinessDocument : Association to BusinessDocuments {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ServiceEndpoints {
    key Id : LargeString not null;
    Name : LargeString;
    Title : LargeString not null;
    Version : LargeString not null;
    Summary : LargeString not null;
    Description : LargeString not null;
    @odata.Type : 'Edm.DateTime'
    LastUpdated : DateTime;
    Protocol : LargeString;
    EntryPoints : Association to many EntryPoints {  };
    ApiDefinitions : Association to many APIDefinitions {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationAdapterDesigntimeArtifacts {
    key Id : LargeString not null;
    Version : LargeString not null;
    PackageId : LargeString;
    Name : LargeString;
    ArtifactContent : LargeBinary;
    Description : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationFlows {
    key Id : LargeString not null;
    Name : LargeString;
    SenderHostType : LargeString;
    ReceiverHostType : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MDIDeltaToken {
    key Operation : LargeString not null;
    key Entity : LargeString not null;
    key Version : LargeString not null;
    DeltaToken : LargeString;
    LastUpdateTimestamp : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity EntryPoints {
    key Url : LargeString not null;
    Name : LargeString not null;
    Type : LargeString;
    AdditionalInformation : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DesignGuidelines {
    key GuidelineId : LargeString not null;
    GuidelineName : LargeString;
    Category : LargeString;
    Severity : LargeString;
    Applicability : LargeString;
    Compliance : LargeString;
    IsGuidelineSkipped : Boolean;
    SkipReason : LargeString;
    SkippedBy : LargeString;
    ExpectedKPI : LargeString;
    ActualKPI : LargeString;
    ViolatedComponents : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ScriptCollectionDesigntimeArtifacts {
    key Id : LargeString not null;
    key Version : LargeString not null;
    PackageId : LargeString;
    Name : LargeString;
    Description : LargeString;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Resources : Association to many Resources {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationPackages {
    key Id : LargeString not null;
    Name : LargeString not null;
    ResourceId : LargeString not null;
    Description : LargeString;
    ShortText : LargeString not null;
    Version : LargeString;
    Vendor : LargeString;
    PartnerContent : Boolean;
    UpdateAvailable : Boolean;
    Mode : LargeString;
    SupportedPlatform : LargeString;
    ModifiedBy : LargeString;
    CreationDate : LargeString;
    ModifiedDate : LargeString;
    CreatedBy : LargeString;
    Products : LargeString;
    Keywords : LargeString;
    Countries : LargeString;
    Industries : LargeString;
    LineOfBusiness : LargeString;
    PackageContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    IntegrationDesigntimeArtifacts : Association to many IntegrationDesigntimeArtifacts {  };
    ValueMappingDesigntimeArtifacts : Association to many ValueMappingDesigntimeArtifacts {  };
    MessageMappingDesigntimeArtifacts : Association to many MessageMappingDesigntimeArtifacts {  };
    ScriptCollectionDesigntimeArtifacts : Association to many ScriptCollectionDesigntimeArtifacts {  };
    CustomTags : Association to many CustomTags {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CustomTagConfigurations {
    key Id : LargeString not null;
    CustomTagsConfigurationContent : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ValMapSchema {
    key SrcAgency : LargeString not null;
    key SrcId : LargeString not null;
    key TgtAgency : LargeString not null;
    key TgtId : LargeString not null;
    State : LargeString;
    ValMaps : Association to many ValMaps {  };
    DefaultValMaps : Association to many DefaultValMaps {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Configurations {
    key ParameterKey : LargeString not null;
    ParameterValue : LargeString;
    DataType : LargeString;
    Description : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ValMaps {
    key Id : LargeString not null;
    Value : Value not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity NumberRanges {
    key Name : LargeString not null;
    Description : LargeString;
    MaxValue : LargeString;
    MinValue : LargeString;
    Rotate : LargeString;
    CurrentValue : LargeString;
    FieldLength : LargeString;
    DeployedBy : LargeString;
    @odata.Type : 'Edm.DateTime'
    DeployedOn : DateTime;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DesignGuidelineExecutionResults {
    key ExecutionId : LargeString not null;
    ArtifactVersion : LargeString;
    ExecutionStatus : LargeString;
    ExecutionTime : LargeString;
    ReportType : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    DesignGuidelines : Association to many DesignGuidelines {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ValueMappingDesigntimeArtifacts {
    key Id : LargeString not null;
    key Version : LargeString not null;
    PackageId : LargeString not null;
    Name : LargeString not null;
    Description : LargeString;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    ValMapSchema : Association to many ValMapSchema {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageMappingDesigntimeArtifacts {
    key Id : LargeString not null;
    key Version : LargeString not null;
    PackageId : LargeString not null;
    Name : LargeString not null;
    Description : LargeString;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Resources : Association to many Resources {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CustomTags {
    key Name : LargeString not null;
    Value : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity APIDefinitions {
    key Url : LargeString not null;
    Name : LargeString not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationConnections {
    key Id : Integer not null;
    ResolvedConnection : Boolean;
    SenderHost : LargeString not null;
    ReceiverHost : LargeString not null;
    IntegrationFlows : Association to many IntegrationFlows {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BuildAndDeployStatus {
    key TaskId : LargeString not null;
    Status : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Resources {
    key Name : LargeString not null;
    key ResourceType : LargeString not null;
    ReferencedResourceType : LargeString;
    ResourceSize : Integer64;
    ResourceSizeUnit : LargeString;
    ResourceContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationDesigntimeLocks {
    key ResourceId : LargeString not null;
    ArtifactId : LargeString not null;
    ArtifactName : LargeString;
    ArtifactType : LargeString;
    PackageId : LargeString;
    PackageName : LargeString;
    @odata.Type : 'Edm.DateTime'
    CreatedAt : DateTime;
    CreatedBy : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DefaultValMaps {
    key Id : LargeString not null;
    Value : Value not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationDesigntimeArtifacts {
    key Id : LargeString not null;
    key Version : LargeString not null;
    PackageId : LargeString;
    Name : LargeString;
    Description : LargeString;
    Sender : LargeString;
    Receiver : LargeString;
    CreatedBy : LargeString;
    CreatedAt : LargeString;
    ModifiedBy : LargeString;
    ModifiedAt : LargeString;
    ArtifactContent : LargeBinary;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Configurations : Association to many Configurations {  };
    Resources : Association to many Resources {  };
    DesignGuidelineExecutionResults : Association to many DesignGuidelineExecutionResults {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IdempotentRepositoryEntries {
    key HexSource : String(2000) not null;
    key HexEntry : String(2000) not null;
    Source : LargeString;
    Entry : LargeString;
    Component : LargeString;
    CreationTime : Integer64;
    ExpirationTime : Integer64;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity GenericIdempotentRepositoryEntries {
    key HexVendor : LargeString not null;
    key HexSource : String(2000) not null;
    key HexEntry : String(2000) not null;
    key HexComponent : String(200) not null;
    Source : LargeString;
    Entry : LargeString;
    Component : LargeString;
    Vendor : String(100);
    CreationTime : Integer64;
    ExpirationTime : Integer64;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IdMapFromIds {
    key FromId : String(200) not null;
    ToIds : Association to many IdMapToIds {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IdMapToIds {
    key ToId : LargeString not null;
    FromId_ : LargeString;
    Mapper : LargeString;
    @odata.Type : 'Edm.DateTimeOffset'
    ExpirationTime : DateTime;
    Qualifier : LargeString;
    Context : LargeString;
    FromId : Association to IdMapFromIds {  };
    FromId2s : Association to many IdMapFromId2s {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IdMapFromId2s {
    key FromId : String(200) not null;
    ToId2 : LargeString;
    Mapper : LargeString;
    @odata.Type : 'Edm.DateTimeOffset'
    ExpirationTime : DateTime;
    Qualifier : LargeString;
    Context : LargeString;
    ToId : Association to IdMapToIds {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Locks {
    key Component : LargeString not null;
    key HexSource : LargeString not null;
    key HexEntry : LargeString not null;
    Source : LargeString;
    Entry : LargeString;
    LockName : LargeString;
    CreationTime : Integer64;
    ExpirationTime : Integer64;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DataStores {
    key DataStoreName : LargeString not null;
    key IntegrationFlow : LargeString not null;
    key Type : LargeString not null;
    Visibility : LargeString;
    NumberOfMessages : Integer64;
    NumberOfOverdueMessages : Integer64;
    Entries : Association to many DataStoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity DataStoreEntries {
    key Id : LargeString not null;
    key DataStoreName : LargeString not null;
    key IntegrationFlow : LargeString not null;
    key Type : LargeString not null;
    Status : LargeString;
    MessageId : LargeString;
    @odata.Type : 'Edm.DateTime'
    DueAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    CreatedAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    RetainUntil : DateTime;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Variables {
    key VariableName : LargeString not null;
    key IntegrationFlow : LargeString not null;
    Visibility : LargeString;
    @odata.Type : 'Edm.DateTime'
    UpdatedAt : DateTime;
    @odata.Type : 'Edm.DateTime'
    RetainUntil : DateTime;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity JmsMessages {
    key Msgid : String(100) not null;
    key Name : String(200) not null;
    key Failed : Boolean not null;
    Mplid : LargeString;
    CreatedAt : Integer64;
    RetryCount : Integer64;
    NextRetry : Integer64;
    MimeMsgid : LargeString;
    ContentType : LargeString;
    MimeVersion : LargeString;
    OverdueAt : Integer64;
    ExpirationDate : Integer64;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Queue : Association to Queues {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Queues {
    key Name : String(200) not null;
    NumbOfMsgs : Integer64;
    Size : Integer64;
    Type : Integer64;
    State : Integer64;
    FillGrade : Integer64;
    Active : Integer64;
    Exclusive : Integer64;
    Messages : Association to many JmsMessages {  };
    Artifacts : Association to many JmsArtifacts {  };
    JmsQueues : Association to many JmsQueues {  };
    Broker : Association to JmsBrokers {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity JmsQueues {
    key Name : String(200) not null;
    MaxQueueSize : Integer64;
    ActiveState : Integer64;
    QueueSize : Integer64;
    State : Integer64;
    Queue : Association to Queues {  };
    Broker : Association to JmsBrokers {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity JmsBrokers {
    key ![Key] : String(10) not null;
    Capacity : Integer64;
    MaxCapacity : Integer64;
    IsTransactedSessionsHigh : Integer;
    IsConsumersHigh : Integer;
    IsProducersHigh : Integer;
    MaxQueueNumber : Integer64;
    QueueNumber : Integer64;
    CapacityOk : Integer64;
    CapacityWarning : Integer64;
    CapacityError : Integer64;
    IsQueuesHigh : Integer;
    IsMessageSpoolHigh : Integer;
    QueueNamesHigh : Association to many JmsQueues {  };
    InactiveQueues : Association to many Queues {  };
    QueueStates : Association to many QueueStates {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity JmsArtifacts {
    key Name : String(200) not null;
    Id : LargeString;
    Direction : Integer64;
    Queue : Association to Queues {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity QueueStates {
    key Name : String(200) not null;
    State : Integer64;
    Broker : Association to JmsBrokers {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity WNNodes {
    key Type : LargeString not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity StringParameters : Parameter {
    Value : String(4000) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity BinaryParameters : Parameter {
    ContentType : String(300) not null;
    Value : Binary(1572864) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity AlternativePartners {
    key Hexagency : String(480) not null;
    key Hexscheme : String(480) not null;
    key Hexid : String(1020) not null;
    Agency : String(120) not null;
    Scheme : String(120) not null;
    Id : String(255) not null;
    Pid : String(60) not null;
    LastModifiedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    LastModifiedTime : DateTime;
    CreatedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    CreatedTime : DateTime;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity AuthorizedUsers {
    key User : String(150) not null;
    Pid : String(60) not null;
    LastModifiedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    LastModifiedTime : DateTime;
    CreatedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    CreatedTime : DateTime;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Partners {
    key Pid : String(60) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity NodeProfiles {
    key Name : String(100) not null;
    Roles : Association to many Roles {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Roles {
    key Name : LargeString not null;
    NodeProfile : Association to NodeProfiles {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity XiDataStores {
    key Name : LargeString not null;
    key Qualifier : LargeString not null;
    Participant : LargeString not null;
    Channel : LargeString not null;
    Artifact : Association to XiDataStoreArtifacts {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity XiDataStoreArtifacts {
    key Id : LargeString not null;
    Name : LargeString;
    DataStores : Association to many XiDataStores {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpKeyEntries {
    key Id : LargeString not null;
    KeyId : LargeString;
    Fingerprint : LargeString;
    Type : LargeString;
    @odata.Type : 'Edm.DateTimeOffset'
    CreatedTime : DateTime;
    Algorithm : LargeString;
    KeyLength : Integer;
    KeyFlags : Integer;
    KeyFlagsLabel : LargeString;
    ValidityState : String(20);
    @odata.Type : 'Edm.DateTimeOffset'
    ValidUntil : DateTime;
    @odata.Type : 'Edm.DateTimeOffset'
    ModifiedOn : DateTime;
    ErrorInformation : LargeString;
    PrimaryUserId : String(512);
    UserIds : Association to many PgpUserIds {  };
    SubKeys : Association to many PgpSubKeys {  };
    PublicResource : Association to PgpKeyPublicResources {  };
    SecretResource : Association to PgpKeySecretResources {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpKeyEntryImportResults {
    key Id : LargeString not null;
    KeyId : LargeString;
    PrimaryUserId : String(512);
    Status : LargeString;
    StatusDetails : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpUserIds {
    key UserId : String(512) not null;
    PgpKeyEntry : Association to PgpKeyEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpSubKeys {
    key Id : LargeString not null;
    KeyId : LargeString;
    @odata.Type : 'Edm.DateTimeOffset'
    CreatedTime : DateTime;
    Algorithm : LargeString;
    KeyLength : Integer;
    KeyFlags : Integer;
    KeyFlagsLabel : LargeString;
    ValidityState : LargeString;
    @odata.Type : 'Edm.DateTimeOffset'
    ValidUntil : DateTime;
    @odata.Type : 'Edm.DateTimeOffset'
    ModifiedOn : DateTime;
    PgpKeyEntry : Association to PgpKeyEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpKeyPublicResources {
    key KeyId : LargeString not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    PgpKeyEntry : Association to PgpKeyEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpKeySecretResources {
    key KeyId : LargeString not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    PgpKeyEntry : Association to PgpKeyEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpKeyringPublicResources {
    key Name : LargeString not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpKeyringSecretResources {
    key Name : LargeString not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @open : true
  entity PgpKeyrings {
    key Name : String(100) not null;
    LastModifiedBy : String(150);
    @odata.Type : 'Edm.DateTimeOffset'
    LastModifiedTime : DateTime;
    Size : Integer;
    RuntimeIds : String(620);
    AggregatedStatus : String(20);
    AggregatedErrors : String(5000);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpPublicKeyrings : PgpKeyrings {
    Runtimes : Association to many KeyringRuntimeAssignment {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity PgpSecretKeyrings : PgpKeyrings {
    Runtimes : Association to many KeyringRuntimeAssignment {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity KeyringRuntimeAssignment {
    key KeyringName : String(30) not null;
    key RuntimeId : String(30) not null;
    Status : String(20) not null;
    StatusUpdatedAt : Integer64 not null;
    Errors : String(5000);
    Pubring : Association to PgpPublicKeyrings {  };
    Secring : Association to PgpSecretKeyrings {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @open : true
  entity KeystoreEntries : KeystoreEntryCertificatePart {
    Type : String(30);
    Owner : String(30);
    LastModifiedBy : String(150);
    @odata.Type : 'Edm.DateTimeOffset'
    LastModifiedTime : DateTime;
    CreatedBy : String(150);
    @odata.Type : 'Edm.DateTimeOffset'
    CreatedTime : DateTime;
    Status : String(500);
    ChainCertificates : Association to many ChainCertificates {  };
    Certificate : Association to CertificateResources {  };
    Sshkey : Association to SSHKeyResources {  };
    Keystore : Association to Keystores {  };
    ChainResource : Association to CertificateChainResources {  };
    SigningRequest : Association to CertificateSigningRequests {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity HistoryKeystoreEntries : KeystoreEntries {
    ActivatedBy : String(150);
    @odata.Type : 'Edm.DateTimeOffset'
    ActiveFrom : DateTime;
    DeactivatedBy : String(150);
    @odata.Type : 'Edm.DateTimeOffset'
    ActiveUntil : DateTime;
    ActivationSequenceNumber : Integer;
    OriginalAlias : String(250);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity KeyPairResources : KeystoreEntryAlias {
    Resource : Binary(30072);
    Password : String(500);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ChainCertificates {
    key Hexalias : String(2000) not null;
    key Index : Integer not null;
    Alias : String(250) not null;
    Validity : String(1000);
    KeyType : String(30);
    KeySize : Integer;
    @odata.Type : 'Edm.DateTimeOffset'
    ValidNotBefore : DateTime;
    @odata.Type : 'Edm.DateTimeOffset'
    ValidNotAfter : DateTime;
    SubjectDN : String(50000);
    IssuerDN : String(50000);
    SerialNumber : String(66);
    SignatureAlgorithm : String(60);
    Version : Integer;
    FingerprintSha1 : String(200);
    FingerprintSha256 : String(200);
    FingerprintSha512 : String(200);
    KeystoreEntry : Association to KeystoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity SSHKeyResources : KeystoreEntryAlias {
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    KeystoreEntry : Association to KeystoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity KeyPairGenerationRequests : KeystoreEntryCertificatePartBase {
    KeyAlgorithmParameter : String(500);
    CommonName : String(500);
    OrganizationUnit : String(500);
    Organization : String(500);
    Locality : String(500);
    State : String(500);
    Country : String(2);
    Email : String(500);
    Extensions : Binary(3000);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CertificateSigningRequests {
    key Hexalias : String(2000) not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    KeystoreEntry : Association to KeystoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CertificateResources : KeystoreEntryAlias {
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    KeystoreEntry : Association to KeystoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CertificateChainResources : KeystoreEntryAlias {
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    KeystoreEntry : Association to KeystoreEntries {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity KeystoreResources {
    key Name : String(100) not null;
    Resource : Binary(6291456);
    Password : String(300);
    Aliases : String(2097152);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity Keystores {
    key Name : String(100) not null;
    LastModifiedBy : String(150);
    @odata.Type : 'Edm.DateTimeOffset'
    LastModifiedTime : DateTime;
    Size : Integer;
    RuntimeIds : String(620);
    AggregatedStatus : String(20);
    AggregatedErrors : String(5000);
    Entries : Association to many KeystoreEntries {  };
    Runtimes : Association to many RuntimeSyncInfos {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity RuntimeSyncInfos {
    key KeystoreName : String(30) not null;
    key RuntimeId : String(30) not null;
    Status : String(20) not null;
    StatusUpdatedAt : Integer64 not null;
    Errors : String(5000);
    Keystore : Association to Keystores {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity SecurityArtifacts {
    key Name : LargeString not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity SSHKeyGenerationRequests : KeystoreEntryCertificatePartBase {
    SSHFile : String(10000);
    Password : String(500);
    KeyAlgorithmParameter : String(500);
    CommonName : String(500);
    OrganizationUnit : String(500);
    Organization : String(500);
    Locality : String(500);
    State : String(500);
    Country : String(2);
    Email : String(500);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity RSAKeyGenerationRequests : KeystoreEntryAlias {
    RSAFile : Binary(10000) not null;
    SignatureAlgorithm : String(60);
    @odata.Type : 'Edm.DateTimeOffset'
    ValidNotBefore : DateTime;
    @odata.Type : 'Edm.DateTimeOffset'
    ValidNotAfter : DateTime;
    SerialNumber : String(256);
    CommonName : String(500);
    OrganizationUnit : String(500);
    Organization : String(500);
    Locality : String(500);
    State : String(500);
    Country : String(2);
    Email : String(500);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity UserCredentialParameters : Parameter {
    User : String(200) not null;
    Password : String(200);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity UserCredentials {
    key Name : LargeString not null;
    Kind : LargeString;
    Description : LargeString;
    User : LargeString;
    Password : LargeString;
    CompanyId : LargeString;
    SecurityArtifactDescriptor : SecurityArtifactDescriptor not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity SecureParameters {
    key Name : String(150) not null;
    Description : String(1024);
    SecureParam : String(4096);
    DeployedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    DeployedOn : DateTime;
    Status : String(20);
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity OAuth2ClientCredentials {
    key Name : String(1024) not null;
    Description : String(1024);
    TokenServiceUrl : String(1024) not null;
    ClientId : String(1024) not null;
    ClientSecret : String(1024);
    ClientAuthentication : String(1024);
    Scope : String(1024);
    ScopeContentType : String(5120);
    Resource : String(1024);
    Audience : String(1024);
    SecurityArtifactDescriptor : SecurityArtifactDescriptor not null;
    CustomParameters : Association to many CustomParameters {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity CustomParameters {
    key ![Key] : String(1024) not null;
    key Value : String(1024) not null;
    key SendAsPartOf : String(1024) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity OAuth2AuthorizationCodes {
    key Name : String(150) not null;
    Type : String(50) not null;
    Description : String(200);
    Provider : String(50) not null;
    TokenUrl : String(2000) not null;
    AuthUrl : String(2000) not null;
    ClientId : String(200) not null;
    ClientSecret : String(1000);
    ClientAuthentication : String(200);
    Scope : String(4000);
    UserName : String(1000);
    RefreshToken : String(20000);
    RefreshTokenCreationTime : Integer64;
    RefreshTokenExisting : Boolean;
    RefreshTokenExpiryPeriod : Integer64 not null;
    LastModifiedBy : String(150);
    LastModifiedTime : Integer64;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity IntegrationRuntimeArtifacts {
    key Id : LargeString not null;
    Version : LargeString;
    Name : LargeString;
    Type : LargeString;
    DeployedBy : LargeString;
    @odata.Type : 'Edm.DateTime'
    DeployedOn : DateTime;
    Status : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    ErrorInformation : Association to RuntimeArtifactErrorInformations {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity RuntimeArtifactErrorInformations {
    key Id : LargeString not null;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity LogFileArchives {
    key Scope : LargeString not null;
    key LogFileType : LargeString not null;
    key NodeScope : LargeString not null;
    ContentType : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogRunStepProperties {
    key RunId : LargeString not null;
    key ChildCount : Integer not null;
    key Name : LargeString not null;
    Value : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageStoreEntries {
    key Id : LargeString not null;
    MessageGuid : LargeString;
    MessageStoreId : LargeString;
    @odata.Type : 'Edm.DateTime'
    TimeStamp : DateTime;
    HasAttachments : Boolean;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Attachments : Association to many MessageStoreEntryAttachments {  };
    Properties : Association to many MessageStoreEntryProperties {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ExternalLoggingEvents {
    key Timestamp : Integer64 not null;
    EventType : LargeString;
    EventObject : LargeString;
    HasError : Boolean;
    StatusText : LargeString;
    StatusChangedAtMillis : Integer64;
    AverageLoadSec : Double;
    AverageLagSec : Double;
    AverageAvailability : Double;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity AuditLogs {
    key ChangeId : LargeString not null;
    Action : LargeString;
    @odata.Type : 'Edm.DateTime'
    Timestamp : DateTime;
    UserName : LargeString;
    ObjName : LargeString;
    ObjType : LargeString;
    Source : LargeString;
    NodeType : LargeString;
    UserType : LargeString;
    CustomerVisible : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity TraceMessageProperties {
    key TraceId : Integer64 not null;
    key Name : LargeString not null;
    Value : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity LogFiles {
    key Name : LargeString not null;
    key Application : LargeString not null;
    @odata.Type : 'Edm.DateTimeOffset'
    LastModified : DateTime;
    ContentType : LargeString;
    LogFileType : LargeString;
    NodeScope : LargeString;
    Size : Integer64;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity AccessPolicies {
    key Id : Integer64 not null;
    RoleName : LargeString;
    Description : LargeString;
    ArtifactReferences : Association to many ArtifactReferences {  };
    AccessPolicyRuntimeAssignments : Association to many AccessPolicyRuntimeAssignments {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity TraceMessages {
    key TraceId : Integer64 not null;
    MplId : LargeString not null;
    RunId : LargeString;
    ModelStepId : LargeString;
    PayloadSize : Integer64;
    MimeType : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Properties : Association to many TraceMessageProperties {  };
    ExchangeProperties : Association to many TraceMessageExchangeProperties {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageStoreEntryAttachments {
    key Id : LargeString not null;
    Name : LargeString;
    ContentType : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
    Properties : Association to many MessageStoreEntryAttachmentProperties {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ArtifactReferences {
    key Id : Integer64 not null;
    Name : LargeString;
    Description : LargeString;
    Type : LargeString;
    ConditionAttribute : LargeString;
    ConditionValue : LargeString;
    ConditionType : LargeString;
    AccessPolicy : Association to AccessPolicies {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageStoreEntryProperties {
    key MessageId : LargeString not null;
    key Name : LargeString not null;
    Value : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ArchivingKeyPerformanceIndicators {
    @odata.Type : 'Edm.DateTime'
    key RunStart : DateTime not null;
    RunDurationInMinutes : Integer;
    DataCollectionDurationInMinutes : Integer;
    DataCompressionDurationInMinutes : Integer;
    DataUploadDurationInMinutes : Integer;
    MplsToBeArchived : Integer;
    MplsArchived : Integer;
    MplsArchivingFailed : Integer;
    @odata.Type : 'Edm.DateTime'
    MplsArchivedUntilDate : DateTime;
    @odata.Type : 'Edm.DateTime'
    DateOfOldestMplToBeArchivedAfterRun : DateTime;
    DataUploadedInMb : Integer;
    RunStatus : LargeString;
    RunFailedPhase : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogs {
    key MessageGuid : LargeString not null;
    CorrelationId : LargeString;
    ApplicationMessageId : LargeString;
    ApplicationMessageType : LargeString;
    @odata.Type : 'Edm.DateTime'
    LogStart : DateTime;
    @odata.Type : 'Edm.DateTime'
    LogEnd : DateTime;
    Sender : LargeString;
    Receiver : LargeString;
    IntegrationFlowName : LargeString;
    Status : LargeString;
    AlternateWebLink : LargeString;
    IntegrationArtifact : IntegrationArtifact not null;
    LogLevel : LargeString;
    CustomStatus : LargeString;
    ArchivingStatus : LargeString;
    ArchivingSenderChannelMessages : Boolean;
    ArchivingReceiverChannelMessages : Boolean;
    ArchivingLogAttachments : Boolean;
    ArchivingPersistedMessages : Boolean;
    TransactionId : LargeString;
    PreviousComponentName : LargeString;
    LocalComponentName : LargeString;
    OriginComponentName : LargeString;
    CustomHeaderProperties : Association to many MessageProcessingLogCustomHeaderProperties {  };
    MessageStoreEntries : Association to many MessageStoreEntries {  };
    ErrorInformation : Association to MessageProcessingLogErrorInformations {  };
    AdapterAttributes : Association to many MessageProcessingLogAdapterAttributes {  };
    Attachments : Association to many MessageProcessingLogAttachments {  };
    Runs : Association to many MessageProcessingLogRuns {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogRunSteps {
    key RunId : LargeString not null;
    key ChildCount : Integer not null;
    @odata.Type : 'Edm.DateTime'
    StepStart : DateTime;
    @odata.Type : 'Edm.DateTime'
    StepStop : DateTime;
    StepId : LargeString;
    ModelStepId : LargeString;
    BranchId : LargeString;
    Status : LargeString;
    Error : LargeString;
    Activity : LargeString;
    RunStepProperties : Association to many MessageProcessingLogRunStepProperties {  };
    TraceMessages : Association to many TraceMessages {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogAttachments {
    key Id : LargeString not null;
    MessageGuid : LargeString;
    @odata.Type : 'Edm.DateTime'
    TimeStamp : DateTime;
    Name : LargeString;
    ContentType : LargeString;
    PayloadSize : Integer64;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ArchivingConfigurations {
    key Id : LargeString not null;
    Active : Boolean not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity ExternalLoggingActivationStatus {
    key Id : LargeString not null;
    Active : Boolean;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity AccessPolicyRuntimeAssignments {
    key Id : Integer64 not null;
    RuntimeLocationId : LargeString;
    TransferStatus : LargeString;
    TransferErrors : LargeString;
    @odata.Type : 'Edm.DateTime'
    StatusUpdatedAt : DateTime;
    AccessPolicy : Association to AccessPolicies {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogErrorInformations {
    key MessageGuid : LargeString not null;
    Type : LargeString;
    LastErrorModelStepId : LargeString;
    @Core.MediaType : 'application/octet-stream'
    blob : LargeBinary;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity TraceMessageExchangeProperties {
    key TraceId : Integer64 not null;
    key Name : LargeString not null;
    Value : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageStoreEntryAttachmentProperties {
    key AttachmentId : LargeString not null;
    key Name : LargeString not null;
    Value : LargeString;
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogCustomHeaderProperties {
    key Id : LargeString not null;
    Name : LargeString;
    Value : LargeString;
    Log : Association to MessageProcessingLogs {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogAdapterAttributes {
    key Id : LargeString not null;
    AdapterId : LargeString;
    AdapterMessageId : LargeString;
    Name : LargeString;
    Value : LargeString;
    MessageProcessingLog : Association to MessageProcessingLogs {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  entity MessageProcessingLogRuns {
    key Id : LargeString not null;
    @odata.Type : 'Edm.DateTime'
    RunStart : DateTime;
    @odata.Type : 'Edm.DateTime'
    RunStop : DateTime;
    LogLevel : LargeString;
    OverallState : LargeString;
    ProcessId : LargeString;
    RunSteps : Association to many MessageProcessingLogRunSteps {  };
  };

  @cds.external : true
  @cds.persistence.skip : true
  @open : true
  entity Parameter {
    key Pid : String(60) not null;
    key Id : String(1500) not null;
    LastModifiedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    LastModifiedTime : DateTime;
    CreatedBy : String(150);
    @odata.Type : 'Edm.DateTime'
    CreatedTime : DateTime;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @open : true
  entity KeystoreEntryAlias {
    key Hexalias : String(2000) not null;
    Alias : String(250) not null;
  };

  @cds.external : true
  @cds.persistence.skip : true
  @open : true
  entity KeystoreEntryCertificatePartBase : KeystoreEntryAlias {
    KeyType : String(30);
    KeySize : Integer;
    @odata.Type : 'Edm.DateTimeOffset'
    ValidNotBefore : DateTime;
    @odata.Type : 'Edm.DateTimeOffset'
    ValidNotAfter : DateTime;
    SerialNumber : String(256);
    SignatureAlgorithm : String(60);
    EllipticCurve : String(500);
  };

  @cds.external : true
  @cds.persistence.skip : true
  @open : true
  entity KeystoreEntryCertificatePart : KeystoreEntryCertificatePartBase {
    Validity : String(1000);
    SubjectDN : String(50000);
    IssuerDN : String(50000);
    Version : Integer;
    FingerprintSha1 : String(200);
    FingerprintSha256 : String(200);
    FingerprintSha512 : String(200);
  };

  @cds.external : true
  type Value {
    SrcValue : LargeString;
    TgtValue : LargeString;
  };

  @cds.external : true
  type SecurityArtifactDescriptor {
    Type : String(1024);
    DeployedBy : String(1024);
    @odata.Type : 'Edm.DateTime'
    DeployedOn : DateTime;
    Status : String(1024);
  };

  @cds.external : true
  type IntegrationArtifact {
    Id : LargeString;
    Name : LargeString;
    Type : LargeString;
    PackageId : LargeString;
    PackageName : LargeString;
  };

  @cds.external : true
  action singleInterchangeProcess(
    Id : LargeString not null,
    ActionName : LargeString not null,
    NoteText : LargeString
  ) returns LargeString;

  @cds.external : true
  action massInterchangeProcess(
    FiltersQuery : LargeString not null,
    ActionName : LargeString not null,
    NoteText : LargeString,
    Parameter1 : LargeString,
    Parameter2 : LargeString,
    Parameter3 : LargeString,
    Parameter4 : LargeString,
    Parameter5 : LargeString
  ) returns LargeString;

  @cds.external : true
  action activateB2BArchivingConfiguration() returns LargeString;

  @cds.external : true
  action DeployIntegrationAdapterDesigntimeArtifact(
    Id : LargeString not null
  ) returns LargeString;

  @cds.external : true
  action ScriptCollectionDesigntimeArtifactSaveAsVersion(
    Id : LargeString not null,
    SaveAsVersion : LargeString not null
  ) returns ScriptCollectionDesigntimeArtifacts;

  @cds.external : true
  action DeployScriptCollectionDesigntimeArtifact(
    Id : LargeString not null,
    Version : LargeString not null
  ) returns LargeString;

  @cds.external : true
  action CopyIntegrationPackage(
    Id : LargeString not null,
    ImportMode : LargeString,
    Suffix : LargeString
  ) returns IntegrationPackages;

  @cds.external : true
  action UpsertValMaps(
    Id : LargeString not null,
    Version : LargeString not null,
    SrcAgency : LargeString not null,
    SrcId : LargeString not null,
    TgtAgency : LargeString not null,
    TgtId : LargeString not null,
    ValMapId : LargeString,
    SrcValue : LargeString not null,
    TgtValue : LargeString not null,
    IsConfigured : Boolean not null
  ) returns ValMaps;

  @cds.external : true
  action DeleteValMaps(
    Id : LargeString not null,
    Version : LargeString not null,
    SrcAgency : LargeString not null,
    SrcId : LargeString not null,
    TgtAgency : LargeString not null,
    TgtId : LargeString not null
  ) returns LargeString;

  @cds.external : true
  action ExecuteIntegrationDesigntimeArtifactsGuidelines(
    Id : LargeString not null,
    Version : LargeString not null
  ) returns LargeString;

  @cds.external : true
  action DeployValueMappingDesigntimeArtifact(
    Id : LargeString not null,
    Version : LargeString not null
  ) returns ValueMappingDesigntimeArtifacts;

  @cds.external : true
  action ValueMappingDesigntimeArtifactSaveAsVersion(
    Id : LargeString not null,
    SaveAsVersion : LargeString not null
  ) returns ValueMappingDesigntimeArtifacts;

  @cds.external : true
  action DeployMessageMappingDesigntimeArtifact(
    Id : LargeString not null,
    Version : LargeString not null
  ) returns MessageMappingDesigntimeArtifacts;

  @cds.external : true
  action MessageMappingDesigntimeArtifactSaveAsVersion(
    Id : LargeString not null,
    SaveAsVersion : LargeString not null
  ) returns MessageMappingDesigntimeArtifacts;

  @cds.external : true
  action UpdateDefaultValMap(
    Id : LargeString not null,
    Version : LargeString not null,
    SrcAgency : LargeString not null,
    SrcId : LargeString not null,
    TgtAgency : LargeString not null,
    TgtId : LargeString not null,
    ValMapId : LargeString not null,
    IsConfigured : Boolean not null
  ) returns DefaultValMaps;

  @cds.external : true
  action IntegrationDesigntimeArtifactSaveAsVersion(
    Id : LargeString not null,
    SaveAsVersion : LargeString not null
  ) returns IntegrationDesigntimeArtifacts;

  @cds.external : true
  action DeployIntegrationDesigntimeArtifact(
    Id : LargeString not null,
    Version : LargeString not null
  ) returns LargeString;

  @cds.external : true
  action deactivateQueue(
    Name : LargeString not null,
    State : LargeString
  ) returns LargeString;

  @cds.external : true
  action activateQueue(
    Name : LargeString not null,
    State : LargeString
  ) returns LargeString;

  @cds.external : true
  function OAuthTokenFromCode() returns LargeString;

  @cds.external : true
  action OAuth2AuthorizationCodeFullAuthUrl() returns LargeString;

  @cds.external : true
  action OAuth2AuthorizationCodeRefreshTokenUpdate() returns LargeString;

  @cds.external : true
  action OAuth2AuthorizationCodeCopy() returns LargeString;

  @cds.external : true
  action CancelMessageProcessingLog(
    Id : LargeString not null
  ) returns MessageProcessingLogs;

  @cds.external : true
  action activateArchivingConfiguration() returns LargeString;

  @cds.external : true
  action deactivateExternalLogging() returns LargeString;

  @cds.external : true
  action activateExternalLogging() returns LargeString;
};

