pub struct MessageHandler;

impl MessageHandler {
    pub fn new() -> Self {
        Self
    }
    
    pub async fn handle_message(&self, _message: &[u8]) -> Result<Vec<u8>, String> {
        println!("📨 Handling network message");
        Ok(vec![])
    }
}
