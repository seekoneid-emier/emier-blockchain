#[cfg(test)]
mod tests {
    use emier_core::EmierConfig;
    
    #[test]
    fn test_config_creation() {
        let config = EmierConfig::load_default().unwrap();
        assert_eq!(config.network.port, 3030);
        assert_eq!(config.sharding.total_shards, 64);
    }
    
    #[test]
    fn test_consensus_types() {
        use emier_consensus::modular_consensus::ConsensusType;
        
        let pos = ConsensusType::PoSFastFinality;
        let poh = ConsensusType::PoHParallel;
        
        assert!(matches!(pos, ConsensusType::PoSFastFinality));
        assert!(matches!(poh, ConsensusType::PoHParallel));
    }
}
