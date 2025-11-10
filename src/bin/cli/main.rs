use clap::{Parser, Subcommand};

#[derive(Parser)]
#[command(name = "emier-cli")]
#[command(about = "Emier Blockchain Command Line Interface")]
struct Cli {
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    /// Node management
    Node {
        #[command(subcommand)]
        action: NodeCommands,
    },
    /// Account management
    Account {
        #[command(subcommand)]
        action: AccountCommands,
    },
    /// Transaction commands
    Transaction {
        #[command(subcommand)]
        action: TransactionCommands,
    },
    /// Show version
    Version,
}

#[derive(Subcommand)]
enum NodeCommands {
    Start { port: Option<u16> },
    Stop,
    Status,
}

#[derive(Subcommand)]
enum AccountCommands {
    Create,
    List,
    Balance { address: String },
}

#[derive(Subcommand)]
enum TransactionCommands {
    Send { from: String, to: String, amount: f64 },
}

fn main() {
    let cli = Cli::parse();
    
    match cli.command {
        Commands::Node { action } => match action {
            NodeCommands::Start { port } => {
                println!("🚀 Starting node on port {}", port.unwrap_or(3030));
            }
            NodeCommands::Stop => println!("🛑 Stopping node"),
            NodeCommands::Status => println!("📊 Node status: Running"),
        },
        Commands::Account { action } => match action {
            AccountCommands::Create => println!("👤 Creating new account"),
            AccountCommands::List => println!("📝 Listing accounts"),
            AccountCommands::Balance { address } => {
                println!("💰 Balance for {}: 1000 EMIER", address);
            }
        },
        Commands::Transaction { action } => match action {
            TransactionCommands::Send { from, to, amount } => {
                println!("💸 Sending {} EMIER from {} to {}", amount, from, to);
            }
        },
        Commands::Version => {
            println!("Emier CLI v1.0.0");
        }
    }
}
