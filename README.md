# Most Pages Views Counter
It is an application that provides list of webpages with the most page views ordered from most pages views to less page views. Also, you can get orderd the most unique page views.

## Technologies Used

- Ruby
- RSpec
- rubocop

## Installation

To get a local copy up and running follow these instructions.

> Firstly clone the repository or download by clicking this [link](https://github.com/Abdusaid10/ruby_app/archive/refs/heads/main.zip).

```bash
git clone git@github.com:Abdusaid10/ruby_app.git
```
> If you cloned the repository then run the following command in the terminal.
```bash
cd ruby_app
```

Otherwise, extract and open the downloaded file, and run the terminal inside the ruby_app folder.

> Install dependencies
```bash
bundle install
```
> Run
```bash
ruby ./bin/main.rb
```
When the app runs you will be promted to enter the filename that contains the server logs. Server logs file must be in the follwing format "/help_page/1 543.910.244.929". If the file exists and it's not an empty file, you will be promted to enter 'm' if you want to get most pages views or 'u' if you want to get unique most page views. 

## Approach
Read and write each line of the given file to an array, and using the Parser class, generate a hash, the key being the name of the page, and the value is an array containing IP addresses visited this page. To count the number of visitors, iterate through each key-value pair, counting the number of items in an array and saving the result in a new hash.