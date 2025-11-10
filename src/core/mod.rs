pub mod config;
pub mod types;

pub use config::EmierConfig;

pub struct EmierBlockchain;

impl Default for EmierBlockchain {
    fn default() -> Self {
        Self::new()
    }
}

impl EmierBlockchain {
    pub fn new() -> Self {
        println!("🚀 Creating Emier Blockchain");
        Self
    }

    pub async fn start(&self) {
        println!("🎯 Starting Emier Blockchain");
    }
}
