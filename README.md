## Robots on mars

## Installing

```
git clone git@github.com:minivan/robots-on-mars.git
cd robots-on-mars
bundle install
```

## Running

If you don't have a test input, you can run the script without any arguments (it will use `./sample/input`):

```sh
ruby bin/mars_mission.rb
```

If you have a different input, you can pass it to the script

```sh
ruby bin/mars_mission.rb input_file_path
```

## Running the tests

```sh
rake
```
