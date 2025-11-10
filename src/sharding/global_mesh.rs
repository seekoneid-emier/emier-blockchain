use tokio::sync::RwLock;
use std::collections::HashMap;

#[derive(Debug, Clone)]
pub struct ShardNode {
    pub node_id: String,
    pub shard_id: u32,
    pub region: String,
    pub stake: f64,
    pub performance_score: f64,
}

#[derive(Debug, Clone)]
pub struct Shard {
    pub id: u32,
    pub region: String,
    pub node_count: u32,
    pub average_latency: f64,
    pub health_status: ShardHealth,
}

#[derive(Debug, Clone)]
pub enum ShardHealth {
    Healthy,
    Degraded(f64),
    Unhealthy,
}

pub struct GlobalShardingMesh {
    shards: RwLock<HashMap<u32, Shard>>,
    node_registry: RwLock<HashMap<String, ShardNode>>,
}

impl GlobalShardingMesh {
    pub fn new() -> Self {
        Self {
            shards: RwLock::new(HashMap::new()),
            node_registry: RwLock::new(HashMap::new()),
        }
    }
    
    pub async fn register_shard(&self, shard_id: u32, region: String) {
        let shard = Shard {
            id: shard_id,
            region: region.clone(),  // Clone di sini
            node_count: 0,
            average_latency: 0.0,
            health_status: ShardHealth::Healthy,
        };
        
        self.shards.write().await.insert(shard_id, shard);
        println!("🌐 Registered shard {} in {}", shard_id, region);
    }
    
    pub async fn add_node(&self, node: ShardNode) -> Result<(), String> {
        if node.stake < 1000.0 {
            return Err("Stake tidak mencukupi".to_string());
        }
        
        self.node_registry.write().await.insert(node.node_id.clone(), node.clone());
        
        // Update shard stats
        if let Some(shard) = self.shards.write().await.get_mut(&node.shard_id) {
            shard.node_count += 1;
        }
        
        println!("🖥️  Node {} assigned to shard {}", node.node_id, node.shard_id);
        Ok(())
    }
    
    pub async fn find_optimal_shard(&self, _transaction: &crate::core::types::Transaction) -> u32 {
        // Simple round-robin shard assignment for now
        0
    }
    
    pub async fn get_shard_info(&self, shard_id: u32) -> Option<Shard> {
        self.shards.read().await.get(&shard_id).cloned()
    }
}
