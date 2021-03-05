fn verse(number: u32) -> String {
    format!("{}\n{}", on_the_wall_line(&number), take_down(&number))
}

fn cups_text(number: &u32) -> String {
    let mut cups_text = match number {
        0 => "No more cups".into(),
        1 => "One more cup".into(),
        n => format!("{} cups", n),
    };
    cups_text.push_str(" of tea");
    cups_text
}

fn on_the_wall(number: &u32) -> String {
    let cups_text = cups_text(number);
    format!("{} on the wall.", cups_text)
}

fn on_the_wall_line(number: &u32) -> String {
    let cups_text = cups_text(number);
    format!("{} on the wall. {}.", cups_text, cups_text)
}

fn take_down(number: &u32) -> String {
    let (take_down, remaining) = match number {
        0 => ("Go to the store and buy some more.", 99),
        1 => ("Take it down and pass it around.", 0),
        n => ("Take one down and pass it around.", n - 1),
    };
    format!("{} {}", take_down, on_the_wall(&remaining))
}

fn main() {
    let verses: Vec<String> = (0..=99).rev().into_iter().map(verse).collect();
    verses.iter().for_each(|line| println!("{}", line));
}