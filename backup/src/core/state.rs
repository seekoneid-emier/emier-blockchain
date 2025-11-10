use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BlockchainState {
    pub block_height: u64,
    pub total_transactions: u64,
    pub active_shards: u32,
    pub network_hashrate: f64,
}

impl Default for BlockchainState {
    fn default() -> Self {
        Self {
            block_height: 0,
            total_transactions: 0,
            active_shards: 64,
            network_hashrate: 0.0,
        }
    }
}

impl BlockchainState {
    pub fn new() -> Self {
        Self::default()
    }
    
    pub fn increment_block_height(&mut self) {
        self.block_height += 1;
    }
    
    pub fn add_transactions(&mut self, count: u64) {
        self.total_transactions += count;
    }
}
