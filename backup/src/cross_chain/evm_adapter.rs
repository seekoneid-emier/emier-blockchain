pub struct EVMAdapter;

impl EVMAdapter {
    pub fn new() -> Self {
        Self
    }
    
    pub async fn execute_evm_call(&self, contract_address: &str, _data: &[u8]) -> Result<Vec<u8>, String> {
        println!("🦊 Executing EVM call to {}", contract_address);
        Ok(vec![])
    }
}
