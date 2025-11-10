#[cfg(test)]
mod tests {
    use emier_core::{EmierConfig, EmierBlockchain};
    
    #[tokio::test]
    async fn test_blockchain_creation() {
        let config = EmierConfig::load_default().unwrap();
        let emier = EmierBlockchain::new(config).await;
        
        assert!(emier.is_ok());
    }
}
