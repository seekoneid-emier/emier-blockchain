use thiserror::Error;

#[derive(Error, Debug)]
pub enum EmierError {
    #[error("Configuration error: {0}")]
    ConfigError(String),
    
    #[error("Network error: {0}")]
    NetworkError(String),
    
    #[error("Consensus error: {0}")]
    ConsensusError(String),
    
    #[error("Storage error: {0}")]
    StorageError(String),
    
    #[error("Transaction error: {0}")]
    TransactionError(String),
    
    #[error("Sharding error: {0}")]
    ShardingError(String),
    
    #[error("Cross-chain error: {0}")]
    CrossChainError(String),
    
    #[error("Security error: {0}")]
    SecurityError(String),
    
    #[error("Execution error: {0}")]
    ExecutionError(String),
    
    #[error("IO error: {0}")]
    IoError(#[from] std::io::Error),
    
    #[error("Serialization error: {0}")]
    SerializationError(String),
}
