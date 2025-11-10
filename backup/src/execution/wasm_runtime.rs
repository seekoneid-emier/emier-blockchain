pub struct WasmRuntime;

impl WasmRuntime {
    pub fn new() -> Self {
        Self
    }
    
    pub async fn execute_contract(&self, _contract_code: &[u8], _input: &[u8]) -> Result<Vec<u8>, String> {
        println!("🦀 Executing WASM contract");
        Ok(vec![])
    }
}
