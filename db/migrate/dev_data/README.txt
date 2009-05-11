Put fixtures that you want to load as migrations into this folder as YML files (e.g. users) then using:

   directory = File.join(File.dirname(__FILE_), '../../test/fixtures/dev_data')
   Fixtures.create_fixtures(directory, "your data")

You can load data, defined in the same way as test fixtures, into your development project as part of migrations. Not recommended for production!

Tip from Agile Web Development with Ruby on Rails, 3rd Ed., Page 302. 
