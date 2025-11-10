pub struct StateShard;

impl StateShard {
    pub fn new(_shard_id: u32) -> Self {
        Self
    }
    
    pub async fn get_state(&self, _key: &str) -> Result<Option<Vec<u8>>, String> {
        Ok(None)
    }
    
    pub async fn set_state(&self, key: &str, _value: &[u8]) -> Result<(), String> {
        println!("💾 Setting state for key: {}", key);
        Ok(())
    }
}
