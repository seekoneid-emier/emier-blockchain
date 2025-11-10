use crate::core::config::EmierConfig;

pub struct EmierBlockchain {
    pub config: EmierConfig,
}

impl EmierBlockchain {
    pub async fn new(config: EmierConfig) -> Result<Self, crate::core::error::EmierError> {
        Ok(EmierBlockchain { config })
    }
    
    pub async fn start(&mut self) -> Result<(), crate::core::error::EmierError> {
        println!("🚀 Starting Emier Blockchain - Next Generation Layer-1");
        println!("📊 Configuration: {} shards, port: {}", 
                 self.config.sharding.total_shards, 
                 self.config.network.port);
        Ok(())
    }
}

#[derive(Debug)]
pub enum SystemMessage {
    ShardUpdate { shard_id: u32, state: crate::core::types::ShardState },
    CrossChainMessage { from_chain: String, to_chain: String, amount: f64 },
    SecurityAlert { level: SecurityLevel, message: String },
}

#[derive(Debug)]
pub enum SecurityLevel {
    Low,
    Medium,
    High,
    Critical,
}
