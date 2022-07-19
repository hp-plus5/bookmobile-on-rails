# bookmobile 📚🚌

The bookmobile is a web app to help one sort through one's library, mentally and physically. It provides various form fields for users to add books to a database. It was originally created in Angular v6 with a C# API with very little experience. Now I have a normal amount of little experience and am looking to strengthen my Ruby on Rails skillset.

This project was generated with [Rails CLI](https://guides.rubyonrails.org/command_line.html) version 7.0.3.1 and uses Ruby on version 3.1.2.

## Minimal Viable Product
It's called the bookmobile - gotta be mobile-friendly or mobile-first.

___
Add fields and corresponding database structure for the following. `*` indicates a required field.

**User model**
- string Username `*` (1+ letters, can contain spaces)
- string Email `*`
- Password `*`
- string RepresentativeImage

**Library model**
- [Book] Books `*` (but can be empty)
- User Creator `*`

*Note that this is only a default library. This does not account for any creation of library management within a user's library.*

**Author model**
- string Name `*`
- string Gender
- bool isQueer
- text Comments

**Book model**
 - string Title `*`
 - [Author] Authors `*`
 - [string] Languages (a frozen enum of options of values composed of simple locale codes, like "EN" and not "EN-GB", to allow for easier internationalization down the road)
 - float DeweyDecimal
 - float Rating
 - [binary] Cover
 - [string] Genres
 - integer PublicationYear
 - [text] Relevant Links

 **PersonalBook model**
 - id
 - Book_id
 - [text] Tags
 - boolean Has been read?
 - boolean Is owned? if true:
    - ? string BookFormat (hardcover, soft cover, audiobook, unpublished edition)
 - boolean Recommended by someone? if true:
    - string Whom
 - float Rating
 - Date CompletionDate
 - enum Cover
 - boolean Has female protagonist?
 - boolean Has queer protagonist?
 - boolean Has other notably queer characters?
 - [text] Relevant Links
 - text Comments

### Views
- Create intake form for a book.
    - Only required fields are title and author
    - Create language field that defaults to English. I'm thinking the form will take on the appearance of tag creation, where there are long gray ovals with the value of the language's name, you can remove them with an "X" button, and you add a new tag by selecting from a pre-made shortlist of 4: English, German, Spanish, and French. Stretch goal: the user can manage what their shortlist is made up of and create custom tags. Store these values as strings in the database to make that refactoring simpler. This feels like it could get hairy on how you organize it. You will want to be able to index on this value for each user's collection. (That seems inefficient if number of users rises. Requires further conversation.)
    - I'm not sure how to best portray/offer genre data. Similar to language field, sans ease to hardcode 4 options.
    - Rating is a 5 star system
    - Book cover can be complex. Requires research into available APIs on the market. Would prefer not to have users having to take pictures or go find cover art on google for each of their books.
        - [Image uploader using HTML5](https://github.com/rossturner/HTML5-ImageUploader)
        - [Similar but in Vue](https://vuejsexamples.com/a-simple-vue-component-for-client-side-image-upload-with-resizing/)
        - [SVG on the Web](https://svgontheweb.com/)
    - Publication year should provide a little information i circle that specifies it is looking for the year first published according to the copyright information near the front cover of the book.
    - Create accordion form that asks questions depending on what the user says. Example: `Did you loan this book out to someone? Y N` could lead to the user selecting `Y`, and from there the app would ask something like, `To whom did you loan this book? ________`. And, if those forms are already filled out on GET, supply a button to easily indicate that the book was returned. Double check and then discard loanee information.
    - Comments field as textarea

## Possible Future Features and Tweaks
### Supplied Data
Pre-populate the fields in the book creation form after the title and author have been determined.
- Add book cover to books. Can be done via image upload from user (👎) or ISBN lookup or scan (👍)
##### Resources
- (In Python) [ISBN Library](https://pypi.org/project/isbnlib/) provides cover art thumbnails and summaries
- (Angular) [Free Google Image Search](https://www.npmjs.com/package/free-google-image-search)
- Google Books API
    - [Developer's Guide](https://developers.google.com/books/docs/viewer/developers_guide)
    - [Sample code for book covers](https://gist.github.com/masao/3904641)
    - [Preview Wizard](https://developers.google.com/books/docs/preview-wizard)
    - [Dynamic Linking](https://developers.google.com/books/docs/dynamic-links)
    - [Demo](https://codepen.io/CarlosTheDwarf/pen/AeLpQN) displaying a successful fetch of title, author, and book cover based on an ISBN using an ajax call:
        ```
        $.ajax({
        dataType: 'json',
        url: 'https://www.googleapis.com/books/v1/volumes?q=isbn:' + isbn,
        success: handleResponse
        });
        ```
- [Open Library Covers API](https://openlibrary.org/dev/docs/api/covers)
- [The LibraryThing](https://thingology.librarything.com/2006/08/introducing-the-thingtitle-api/) is an API that given a title, returns an ISBN, which is the thing required as intake for most third party APIs.

### Browsing
- The ability to go browsing through others' libraries and profiles

### Search Capabilities
- Allow the user to sort books
    - alphabetically by title or by author last name
    - by publication year
    - by rating
- Allow the user to filter books with compounding filters (by whether it's owned AND by whether it's been read, for example). Keep in mind the possibility of creating indices in the database.
    - by genre
    - by language
    - by "has been read"
    - by "is not owned" to see what is currently on loan
    - by whether it's been recommended
- Allow the user to search their books efficiently, whether by title or by other field
    ##### Resources
- [UI for Multiple Filters](https://netbasal.com/manage-your-filters-like-a-pro-in-angular-with-combinelatest-e7b0204be2df)

### Playlists
- Allow users to create "playlists" of books; adding and reordering from custom lists. Possible use cases for lists would include "to read", "recommended by friends", "on loan from library", "books on 18th century linguistic transitions due to migrations in europe", and "dog training!!!! 🐕🌄🚀"
    - Allow the user to search books during playlist management
    - Allow the user to add an individual book to a playlist from book preview page
    - Allow the user to select a group of books from book list screen and add them to a playlist
    - Allow the user to drag and drop their books to the desired order within a playlist

### Data Display
- Allowing the user to see charts depicting their reading habits by genre or publication year. Inspired by Angular library [NGX-Charts](https://swimlane.github.io/ngx-charts/#/ngx-charts/bar-vertical).
- Google Charts API?

### Book Clubs
- Users can create and join book clubs of other users.

    **BookClub model**
    - string Name `*`
    - [User] Members `*` (but automatically includes creator)
    - [string] Languages `*` (a frozen enum of options of values composed of simple locale codes, like "EN" and not "EN-GB", to allow for easier internationalization down the road)
    - text Description
    - string RepresentativeImage
    - Book CurrentBook
    - [Book] PastBooks
    - [Book] RecommendedBooks - these are books members have suggested as being the upcoming reading. This could fledge itself into a new model/form/feature. Any member can submit a book to this list.
    - [string] Genres - in case a book club wants to stick to general genres such as "Fiction", "YA Fiction", "Memoir", and/or "Science Fiction". Visualized as tags.

    #### Views
    - Create creation form for a book club
    - Create a view for a book club
    - Create a way to peruse book clubs

    #### Book Club Subfeatures
    - Create a way for conversations to happen within a book club
    - Create intake form for a book a member would like to submit as the upcoming reading. Make it accessible from the book club page and the book view page in a given user's library if they belong to a book club. If they do not, show the option but disable it.
    - Create calendar events for book clubs
        - Give users the ability to suggest or vote a date/time, like Polly in Slack
    - Give users the ability to tag other users


### Genre Fonts
- Print each genre name in its appropriate font. Romance in Sabon. Crime, noir, suspense, action in Oswald. Literary nonfiction in Garamond.

### Community Readings
- Create events where authors can conduct talks
- Where any user can host and read a book out loud to an audience
- Where libraries can add their events or a user can add their library's events
- To allow for one-off style book clubs, something low-commitment. "I just read this and I want to talk to someone about it"

### General Chatroom
- A space where anyone can appear and chime in at any time, ask about what other people are reading, stumble into friendships
- Give users the ability to tag other users

### Accessibility
- Allow for accessible settings such as high contrast mode (light & dark) and changing the font to be more legible for dyslexic readers.

### Further Data Collection
- Potentially record further data such as asexual or bisexual specific queer identities

### Gamification
- Find ways to gamify the reading experience in ways that encourage users to get offline, not spent more time online. Review this [article](https://www.rufusleonard.com/blog/how-to-increase-behavioural-change-through-gamification), or enjoy these excerpts:
    - "Micro failures are essential for long-standing behavioural change. To succeed, gamification should be built around emotions, with goals designed around humans failing often." 
    - "Successful gamification strategies remove human blockers and make people feel in control when really, they’re being led. Though, that’s not to say some ‘name and shame’ or negative scoring won’t spur people into action. Conversely, encouraging user partnership makes people more likely to commit and be motivated to act."
    - "Remember, it’s not always about progress; humans need to breathe. It’s our responsibility to encourage healthy participation, plotting spaces to take a break."

### Quizzes
- Allow users to create quizzes as a means of recommending books, authors, genres, or whatever have you to other users. "If you like dark fantasy, campfires, and hot tea, try 'A Book' by An Author."

### Profile
 - Have the user select five books they feel best represent them and display that

### Recommendations
 - Share books or recommend them to a specific person, e-vite style

### Computer-Generated Book Suggestions
 - "These are books in the same genre that your friends are reading"

## Development server & Build

Run `rails s` for a dev server with default Rails's `Puma`. Navigate to `http://localhost:3000/`. The app will automatically reload if you change any of the source files. The build artifacts will be stored in the `dist/` directory. Alternatively, one could run `ng serve` and use the `--prod` flag for a production build.

## Running tests

No tests are currently implemented in this project.

## Further information

* System dependencies

* Configuration

* Database creation

* Database initialization

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
