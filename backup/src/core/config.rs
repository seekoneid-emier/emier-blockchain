use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EmierConfig {
    pub network: NetworkConfig,
    pub sharding: ShardingConfig,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NetworkConfig {
    pub name: String,
    pub port: u16,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ShardingConfig {
    pub total_shards: u32,
}

impl EmierConfig {
    pub fn load_default() -> Result<Self, Box<dyn std::error::Error>> {
        let config = EmierConfig {
            network: NetworkConfig {
                name: "emier-mainnet".to_string(),
                port: 3030,
            },
            sharding: ShardingConfig { total_shards: 64 },
        };

        Ok(config)
    }
}
