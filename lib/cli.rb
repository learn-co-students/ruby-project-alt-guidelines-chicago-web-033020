class CommandLineInterface
    
    def handleStockSelection
        puts "\e[H\e[2J"
        puts "Here is a list of all of our available stocks:"
        puts "\n"
        puts Stock.all
        puts "Please enter a company name from the list to get more info:"
        selectedStockName = gets.chomp.capitalize
        foundCompany = Stock.find_by(company_name: selectedStockName)
        puts "You chose: #{foundCompany.company_name}\nIts abbreviation is: #{foundCompany.abbreviation}\nIts price is: #{foundCompany.price}"
    end

    def createPurchase
        puts "\e[H\e[2J"
        # purchase is join
        puts "Choose your file (enter name):"
        puts Shareholder.all
        shareholderName = gets.chomp.capitalize
        foundShareholder = Shareholder.find_by(name: shareholderName)
        puts "You chose: #{foundShareholder.name}, they are from '#{foundShareholder.city}'"
        puts "..."
        puts "Now choose your stock (enter id):"
        puts Stock.all
        selectedStockID = gets.chomp.to_i
        puts "And then choose the total amount:"
        selectedQuantity = gets.chomp.to_i

        Purchase.create(shareholder_id: foundShareholder.id, stock_id: selectedStockID, quantity: selectedQuantity)
        puts "The following purchase has been created: \nshareholder_id: #{foundShareholder.id}\ncompany_id: #{selectedStockID}\nquantity: #{selectedQuantity}"
    end

    def updateOptions
        puts "\e[H\e[2J"
        puts ". . ."
        puts "You chose Update - what do you want to update?"
        puts "Shareholders  Stocks  Purchases"
        selectViewOpt = gets.chomp.capitalize.delete_suffix("s")
        if selectViewOpt == "Shareholder"
            puts ". . ."
            puts Shareholder.all
            puts "You chose #{selectViewOpt}, who do you wish to update?(enter ID)"
        elsif selectViewOpt == "Stock"
            puts ". . ."
            puts Stock.all
            puts "You chose #{selectViewOpt}, what do you wish to update?(enter ID)"
        elsif selectViewOpt == "Purchase"
            puts Purchase.all
            puts ". . ."
            puts "You chose #{selectViewOpt}, what do you wish to update?(enter ID)"
            selectPurchaseID = gets.chomp
            selectFinder = Purchase.find_by(id: selectPurchaseID)
            puts "You chose: #{selectFinder}"
            puts ". . ."
            puts "You can only update the quantity - would you like to proceed?"
            selectPurchYN = gets.chomp.capitalize
            if selectPurchYN == "Yes"
                puts "What would you like to change it to?"
                selectQuantity = gets.chomp.to_i
                selectFinder.update(quantity: selectQuantity)
                puts selectFinder
            elsif selectPurchYN == "no"
                puts "you chose no"
            end
        end
    end

    def deleteOptions
        puts "\e[H\e[2J"
        puts "You chose Delete"
        puts "The only delete option available atm are the Purchases - would you like to proceed?"
        selectDeleteChoice = gets.chomp.capitalize
        if selectDeleteChoice == "Yes"
            puts Purchase.all
            puts "Which record would you like to delete? (enter ID)"
            selectorDeleteID = gets.chomp
            finderDeleteID = Purchase.find_by(id: selectorDeleteID)
            puts "You chose: #{finderDeleteID} - is this correct?"
            confirmDelete = gets.chomp.capitalize
            if confirmDelete == "Yes"
                puts ". . ."
                finderDeleteID.destroy
                puts "*Purchase Deleted*"
                puts Purchase.all 
                puts "Now showing: updated purchases list"
            end
        end
    end

    def endRepeat
        puts "What would you like to do?"
        puts "View  Create  Update  Delete (or exit)"
        user_input = gets.chomp
    end

    def waitForEnter
        puts "Done. Press enter to continue"
        gets.chomp
    end

end