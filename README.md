# Phase 3 Practice Code Challenge: Boardgamers

We have three models: `Boardgame`, `Review`, and `Player`.

For our purposes, a `Boardgame` has many `Review`s, a `Player` has many
`Review`s, and a `Review` belongs to a `Boardgame` and a `Player`.

`Boardgame` - `Player` is a many to many relationship.

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods may rely on earlier ones.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

## What You Already Have

The starter code has migrations and models for the initial `Boardgame` and
`Player` models, and seed data for some `Boardgame`s and `Player`s. The
schema currently looks like this:

### `boardgames` Table

| Column        | Type    |
| ------------- | ------- |
| name          | String  |
| year_released | Integer |

### `players` Table

| Column     | Type   |
| ---------- | ------ |
| first_name | String |
| last_name  | String |

You will need to create the migration for the `reviews` table using the
attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `reviews` table.

- A `Review` belongs to a `Boardgame`, and a `Review` also belongs to an
  `Player`. In your migration, create any columns your `reviews` table will
  need to establish these relationships.
- The `reviews` table should also have:
  - A `hours_played` column that stores an integer.
  - A `content` column that stores a string.

After creating the `reviews` table using a migration, use the `seeds.rb` file to
create instances of your `Review` class so you can test your code.

### Object Relationship Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Review

- `Review#boardgame`
  - should return the `Boardgame` instance for this review
- `Review#player`
  - should return the `Player` instance for this review

#### Boardgame

- `Boardgame#reviews`
  - returns a collection of all the reviews for the `Boardgame`
- `Boardgame#players`
  - returns a collection of all the players who reviewed the `Boardgame`

#### Player

- `Player#reviews`
  - should return a collection of all the reviews that the `Player` has left
- `Player#boardgames`
  - should return a collection of all the boardgames that the `Player` has
    reviewed

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `Player.first.boardgames` and see a list
of the boardgames for the first player in the database based on your seed
data; and `Review.first.player` should return the player for the first
review in the database.

### Aggregate and Association Methods

#### Review

- `Review#full_review`
  - should return a string formatted as follows:

```txt
Review for {insert boardgame name} by {insert player name}: {insert review content}.
```

#### Player

- `Player#full_name`
  - returns the full name of the player, with the first name and the last name
    concatenated
- `Player#favorite_game`
  - returns the game that has the highest hours_played amongst this players reviews
- `Player#add_review(boardgame, content, hours_played)`
  - takes a `boardgame` (an instance of the `Boardgame` class), content, and a hours_played
  - creates a new review for the boardgame with the given `boardgame_id`
- `Player#play_game(boardgame)`
  - takes a `boardgame` (an instance of the `Boardgame` class) and
  - increments the hours_played by 1 for **all** reviews the player has for this boardgame
  - this is a complex problem so break it down into steps before you proceed

#### Boardgame

- `Boardgame.oldest`
  - returns _one_ boardgame instance for the boardgame that has the earliest
    year
- `Boardgame#all_full_reviews`
  - returns a new array of strings for each of the boardgame's reviews formatted like so:

  ```txt
  Review for {insert boardgame name} by {insert player name}: {insert review content}.
  ```
