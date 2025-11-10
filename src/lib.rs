//! Emier Blockchain Core Library

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_basic_math() {
        assert_eq!(2 + 2, 4);
    }

    #[test]
    fn test_string_operations() {
        let s = String::from("hello");
        assert!(!s.is_empty());
    }

    #[test]
    fn test_boolean_logic() {
        assert!(true);
        assert!(!false);
    }
}

/// Sample function for testing
pub fn add(a: i32, b: i32) -> i32 {
    a + b
}

#[cfg(test)]
mod integration_tests {
    use super::*;

    #[test]
    fn test_add_function() {
        assert_eq!(add(2, 3), 5);
        assert_eq!(add(-1, 1), 0);
    }
}
