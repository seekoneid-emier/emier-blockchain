pub struct Encryption;

impl Encryption {
    pub fn new() -> Self {
        Self
    }
    
    pub fn encrypt(&self, data: &[u8], _key: &[u8]) -> Vec<u8> {
        println!("🔒 Encrypting data");
        data.to_vec()
    }
    
    pub fn decrypt(&self, encrypted_data: &[u8], _key: &[u8]) -> Vec<u8> {
        println!("🔓 Decrypting data");
        encrypted_data.to_vec()
    }
}
