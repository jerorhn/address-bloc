require_relative '../models/address_book'

RSpec.describe AddressBook do
  describe "attributes" do
    it "responds to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end
    it "initializes entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_an(Array)
    end
    it "initializes entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end
  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end
    it "adds the correct information to entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "removes only one entry to the address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('Beth Lovelace', '010.483.1815', 'beth.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end
    it "removes the correct information from entries when the first entry is removed" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('Beth Lovelace', '010.483.1815', 'beth.king@lovelace.com')
      book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

      expect(book.entries[0].name).to eq('Beth Lovelace')
      expect(book.entries[0].phone_number).to eq('010.483.1815')
      expect(book.entries[0].email).to eq('beth.king@lovelace.com')
    end
    it "removes the correct information from entries when a later entry is removed" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('Beth Lovelace', '010.483.1815', 'beth.king@lovelace.com')
      book.add_entry('Dolly Lovelace', '483.483.1815', 'dolly.king@lovelace.com')
      book.remove_entry('Beth Lovelace', '010.483.1815', 'beth.king@lovelace.com')

      expect(book.entries[0].name).to eq('Ada Lovelace')
      expect(book.entries[0].phone_number).to eq('010.012.1815')
      expect(book.entries[0].email).to eq('augusta.king@lovelace.com')

      expect(book.entries[1].name).to eq('Dolly Lovelace')
      expect(book.entries[1].phone_number).to eq('483.483.1815')
      expect(book.entries[1].email).to eq('dolly.king@lovelace.com')
    end
  end

end
