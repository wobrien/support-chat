# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

password = PasswordDigester.digest('00x')

jb = User.create! first_name: 'James', last_name: 'Bond',       email: 'jb@mi6.gov.uk', password_digest: password
em = User.create! first_name: 'Eve',   last_name: 'Moneypenny', email: 'em@mi6.gov.uk', password_digest: password

Chat.create! title: 'Cannot print certificate', content: 'Have completed course put cannot print certification'
Chat.create! title: 'Can print certificate', content: 'Have not completed course put can print certification'
Chat.create! title: 'Done ', content: 'and Dusted', closed: true,  assigned_to_id: 2
