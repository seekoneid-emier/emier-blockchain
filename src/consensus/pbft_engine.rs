use async_trait::async_trait;

pub struct PBFTEngine;

impl PBFTEngine {
    pub fn new() -> Self {
        Self
    }
}

#[async_trait]
impl crate::consensus::modular_consensus::ConsensusEngine for PBFTEngine {
    async fn start(&self, shard_id: u32) -> Result<(), String> {
        println!("🏢 Starting PBFT for shard {}", shard_id);
        Ok(())
    }
    
    async fn stop(&self, shard_id: u32) -> Result<(), String> {
        println!("🛑 Stopping PBFT for shard {}", shard_id);
        Ok(())
    }
    
    async fn get_metrics(&self) -> crate::consensus::modular_consensus::ConsensusMetrics {
        crate::consensus::modular_consensus::ConsensusMetrics {
            tps: 2000.0,
            latency: 3.0,
            finality_time: 5.0,
            security_score: 0.99,
        }
    }
}
