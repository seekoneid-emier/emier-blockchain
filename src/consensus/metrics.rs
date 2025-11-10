use serde::{Deserialize, Serialize};

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ConsensusMetrics {
    pub tps: f64,
    pub latency: f64,
    pub finality_time: f64,
    pub security_score: f64,
    pub block_time: f64,
    pub validator_count: u32,
    pub participation_rate: f64,
}

impl Default for ConsensusMetrics {
    fn default() -> Self {
        Self {
            tps: 0.0,
            latency: 0.0,
            finality_time: 0.0,
            security_score: 0.0,
            block_time: 0.0,
            validator_count: 0,
            participation_rate: 0.0,
        }
    }
}
