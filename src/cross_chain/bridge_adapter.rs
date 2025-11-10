pub struct BridgeAdapter;

impl BridgeAdapter {
    pub fn new(_chain_name: &str) -> Self {
        Self
    }
    
    pub async fn connect(&self) -> Result<(), String> {
        println!("🌉 Connecting bridge adapter");
        Ok(())
    }
}
