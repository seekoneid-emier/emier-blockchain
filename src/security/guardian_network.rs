use std::collections::HashMap;

pub struct Guardian {
    pub id: String,
    pub stake: f64,
    pub reputation: f64,
    pub is_active: bool,
}

pub struct GuardianNetwork {
    guardians: HashMap<String, Guardian>,
}

impl GuardianNetwork {
    pub fn new() -> Self {
        Self {
            guardians: HashMap::new(),
        }
    }
    
    pub fn add_guardian(&mut self, guardian: Guardian) {
        println!("🛡️ Adding guardian: {} with stake: {}", guardian.id, guardian.stake);
        self.guardians.insert(guardian.id.clone(), guardian);
    }
    
    pub fn verify_shard(&self, _shard_id: u32) -> bool {
        let active_guardians: Vec<&Guardian> = self.guardians
            .values()
            .filter(|g| g.is_active && g.reputation > 0.8)
            .collect();

        if active_guardians.len() < 3 {
            println!("⚠️ Not enough active guardians for verification");
            return false;
        }

        let verification_score: f64 = active_guardians
            .iter()
            .map(|g| g.reputation)
            .sum::<f64>() / active_guardians.len() as f64;

        verification_score > 0.7
    }
}
