pub struct MerkleTrie;

impl MerkleTrie {
    pub fn new() -> Self {
        Self
    }
    
    pub fn calculate_root(&self, _items: &[Vec<u8>]) -> Vec<u8> {
        println!("🌳 Calculating Merkle root");
        vec![0u8; 32]
    }
}
