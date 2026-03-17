use std::collections::{BTreeMap, BTreeSet, HashMap};
use std::env;
use std::fs;

struct IndexHash<'s> {
    data: Vec<&'s str>
}
impl<'s> IndexHash<'s> {
    fn new() -> Self {
        IndexHash{data: Vec::new()}
    }
    fn idx_of(&mut self, v: &'s str) -> usize {
        if let Some(pos) = self.data.iter().position(|p| *p == v) {
            pos
        } else {
            let new_idx = self.data.len();
            self.data.push(v);
            new_idx
        }
    }
    fn len(&self) -> usize {
        self.data.len()
    }
}

fn main() {
    let path = env::args().nth(1).expect("usage: program <file>");
    let content = fs::read_to_string(path).expect("failed to read file");

    let mut sections = IndexHash::new();
    let mut kernels = IndexHash::new();
    let mut settings = IndexHash::new();
    let mut metrics = Vec::new();

    for line in content.lines() {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }

        let mut line_parts = line.split('\t');
        
        let first_part = line_parts.next().unwrap();

        if line.contains("cache") {
            sections.idx_of(first_part);
            let mut total_setting = String::new();
            for p in line_parts {
                if p.contains("cache") {
                    settings.idx_of(p);
                }
            }
            continue;
        }

        if first_part == "Name" {
            metrics = line_parts.collect();
            continue;
        }
        kernels.idx_of(first_part);
    }

    let mut data = vec![vec![vec![Vec::new(); kernels.len()]; settings.len()]; sections.len()];

    let mut section = usize::MAX;
    let mut setting = usize::MAX;

    for line in content.lines() {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }

        let mut line_parts = line.split('\t');

        let first_part = line_parts.next().unwrap();

        if line.contains("cache") {
            section = sections.idx_of(first_part);
            
            for p in line_parts {
                if p.contains("cache") {
                    setting = settings.idx_of(p);
                }
            }
            continue;
        }


        if first_part == "Name" {
            continue;
        }
        let kernel = kernels.idx_of(first_part);

        data[section][setting][kernel] = line_parts.collect();
    }

    for section in 0..sections.len() {
        for metric in 0..metrics.len() {
            print!("{}: {}", sections.data[section], metrics[metric]);
            for setting in &settings.data {
                print!("\t{setting}");
            }
            println!();
            for kernel in 0..kernels.len() {
                print!("{}", kernels.data[kernel]);
                for setting in 0..settings.len() {
                    print!("\t{}", data[section][setting][kernel][metric]);
                }
                println!();
            }
        }
    }
}
