class CommandLineInterface
    
    def viewSelection
        puts "\e[H\e[2J"
        puts "What would you like to view?"
        puts "Purchases  Shareholders  Stocks"
        userViewSelector = gets.chomp.capitalize
        if userViewSelector == "Purchases"
            puts Purchase.all
            puts "\nNow showing Purchase list."
        elsif userViewSelector == "Shareholders"
            puts Shareholder.all
            puts "\nNow showing Shareholder list"
        elsif userViewSelector == "Stocks"
            puts Stock.all
            puts "\nNow showing Stock list"
        end

    end

    def createSelection
        puts "\e[H\e[2J"
        puts "What would you like to create?"
        puts "Purchase  Stock  Shareholder"
        userCreateSelector = gets.chomp.capitalize
        if userCreateSelector == "Purchase"
            puts "\e[H\e[2J"
            puts Purchase.all
            puts "\n*Now showing current Purchase list*"
            puts "\n"
            waitForEnter
            puts Shareholder.all
            puts "\n*Now showing current Shareholder list*"
            puts "\nChoose the desired shareholder (enter name)"
            userPurchaseNameSelector = gets.chomp.capitalize
            foundShareholder = Shareholder.find_by(name: userPurchaseNameSelector)
            puts "You chose #{foundShareholder.name} - is this correct?"
            userPurchaseYN = gets.chomp.capitalize
            if userPurchaseYN == "Yes"
                puts Stock.all
                puts "\n*Now showing current Stock list*"
                puts "\nChoose the desired stock (enter name)"
                userStockNameSelector = gets.chomp.capitalize
                foundStock = Stock.find_by(company_name: userStockNameSelector)
                puts "You chose #{foundStock.company_name} - is this correct?"
                userStockNameYN = gets.chomp.capitalize
                if userStockNameYN == "Yes"
                    puts "Great. Now how many stocks would you like to purchase?"
                    selectStockQuantity = gets.chomp.to_i
                    puts ". . . Processing . . ."
                    waitForEnter
                    Purchase.create(shareholder_id: foundShareholder.id, stock_id: foundStock.id, quantity: selectStockQuantity)
                    puts Purchase.all
                    puts "\n*Now showing updated Purchase list*"
                elsif userStockNameYN == "No" 
                    "You chose no"
                end
            elsif userPurchaseYN == "No"
                puts "You chose no"
            end
        elsif userCreateSelector == "Stock"
            puts "\e[H\e[2J"
            puts Stock.all
            puts "\nNow showing current Stock list"
            waitForEnter
            puts "Enter company name:"
            createStockName = gets.chomp.capitalize
            puts "You entered #{createStockName} - is this correct?"
            stockNameVerify = gets.chomp.capitalize
            if stockNameVerify == "Yes"
                puts "Enter company name abbreviation:"
                createStockAbbreviation = gets.chomp.upcase
                puts "You entered #{createStockName} - is this correct?"
                stockAbbreviationVerify = gets.chomp.capitalize
                if stockAbbreviationVerify == "Yes"
                    puts "Enter company price:"
                    createCompanyPrice = gets.chomp.to_i
                    puts "You entered #{createCompanyPrice} - is this correct?"
                    companyPriceVerify = gets.chomp.capitalize
                    if companyPriceVerify == "Yes"
                        puts ". . . Processing . . ."
                        Stock.create(company_name: createStockName, abbreviation: createStockAbbreviation, price: createCompanyPrice)
                        puts Stock.all
                        puts "Now showing updated Stock list"
                    elsif companyPriceVerify == "No"
                        puts "You chose no"
                    end
                elsif stockAbbreviationVerify == "No"
                    puts "You chose no"
                end
            elsif stockNameVerify == "No"
                puts "You chose no"
            end
        elsif userCreateSelector == "Shareholder"
            puts "\e[H\e[2J"
            puts Shareholder.all
            puts "Now showing current Shareholder list"
            waitForEnter
            puts "Enter shareholder name:"
            createShareholderName = gets.chomp.capitalize
            puts "You chose #{createShareholderName} - is this correct?"
            createShareholderVerify = gets.chomp.capitalize
            if createShareholderVerify == "Yes"
                puts "Enter location(city):"
                createShareholderCity = gets.chomp.capitalize
                puts "You entered #{createShareholderCity} - is this correct?"
                createShareholderCityVerify = gets.chomp.capitalize
                if createShareholderCityVerify == "Yes"
                    puts ". . . Processing . . ."
                    Shareholder.create(name: createShareholderName, city: createShareholderCity)
                    puts Shareholder.all
                    puts "Now showing udpated Shareholder list"
                elsif 
                    puts "You chose no"
                end
            elsif createShareholderVerify == "No"
                puts "You chose no"
            end
        end
    end

    def updateSelection
        puts "\e[H\e[2J"
        puts "You chose Update - what do you want to update?"
        puts "Shareholders  Stocks  Purchases"
        selectViewOpt = gets.chomp.capitalize
        if selectViewOpt == "Shareholders"
            puts Shareholder.all
            puts "You chose Shareholders, who do you wish to update?(enter name)"
            getShareholderName = gets.chomp.capitalize
            selectShareholder = Shareholder.find_by(name: getShareholderName)
            puts "You chose #{selectShareholder.name} - is this correct?"
            selectShareholderVerify = gets.chomp.capitalize
            if selectShareholderVerify == "Yes"
                puts "What would you like to update?"
                puts "Name  City"
                selectShareholderOption = gets.chomp.capitalize
                if selectShareholderOption == "Name"
                    puts "Enter new name:"
                    updateShareholderName = gets.chomp.capitalize
                    puts "You entered #{updateShareholderName} - is this correct?"
                    updateShareholderNameVerify = gets.chomp.capitalize
                    if updateShareholderNameVerify == "Yes"
                        selectShareholder.update(name: updateShareholderName)
                        puts selectShareholder
                        puts "Now showing updated Shareholder"
                    elsif updateShareholderNameVerify == "No"
                        puts "You chose no"
                    end
                elsif selectShareholderOption == "City"
                    puts "Enter new city name:"
                    updateShareholderCity = gets.chomp.capitalize
                    puts "You entered #{updateShareholderCity} - is this correct?"
                    updateShareholderCityVerify = gets.chomp.capitalize
                    if updateShareholderCityVerify == "Yes"
                        selectShareholder.update(city: updateShareholderCity)
                        puts selectShareholder
                        puts "Now showing updated Shareholder"
                    elsif updateShareholderCityVerify == "No"
                        puts "You chose no"
                    end
                end
            elsif selectShareholderVerify == "No"
                "You chose no"
            end
        elsif selectViewOpt == "Stocks"
            puts Stock.all
            puts "You chose Stocks, what do you wish to update?(enter name)"
            getStockName = gets.chomp.capitalize
            selectStock = Stock.find_by(company_name: getStockName)
            puts "You chose #{selectStock.company_name} - is this correct?"
            selectStockVerify = gets.chomp.capitalize
            if selectStockVerify == "Yes"
                puts "What do you want to update?"
                puts "company_name  abbreviation  price"
                stockUpdateSelection = gets.chomp.downcase
                if stockUpdateSelection == "company_name"
                    puts "Enter new company name:"
                    getNewCompanyName = gets.chomp.capitalize
                    puts "You entered #{getNewCompanyName} - is this correct?"
                    newCompanyNameVerify = gets.chomp.capitalize
                    if newCompanyNameVerify == "Yes"
                        puts ". . . Processing . . ."
                        selectStock.update(company_name: getNewCompanyName)
                        puts selectStock
                        puts "Now showing updated Stock"
                    elsif newCompanyNameVerify == "No"
                        "You chose no"
                    end
                elsif stockUpdateSelection == "abbreviation"
                    puts "Enter new abbreviation (4 letters):"
                    getNewAbbreviation = gets.chomp.upcase
                    puts "You chose #{getNewAbbreviation} - is this correct?"
                    newAbbreviationVerify = gets.chomp.capitalize
                    if newAbbreviationVerify == "Yes"
                        puts ". . . Processing . . ."
                        selectStock.update(abbreviation: getNewAbbreviation)
                        puts selectStock
                        puts "Now showing updated Stock"
                    elsif getNewAbbreviation == "no"
                        puts "You chose no"
                    end
                elsif stockUpdateSelection == "price"
                    puts "Enter new price"
                    getNewPrice = gets.chomp.to_i
                    puts "You entered #{getNewPrice} - is this correct?"
                    newPriceVerify = gets.chomp.capitalize
                    if newPriceVerify == "Yes"
                        puts ". . . Processing . . ."
                        selectStock.update(price: getNewPrice)
                        puts selectStock
                        puts "Now showing updated Stock"
                    elsif newPriceVerify == "No"
                        puts "You entered no"
                    end
                end
            elsif selectStockVerify == "No"
                puts "You chose no"
            end
        elsif selectViewOpt == "Purchases"
            puts Purchase.all
            puts ". . ."
            puts "You chose Purchases, what do you wish to update?(enter ID)"
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

    def deleteSelection
        puts "\e[H\e[2J"
        puts "You chose Delete - what would you like to delete?"
        puts "Purchases  Shareholders  Stocks"
        getDeletePrompt = gets.chomp.capitalize
        if getDeletePrompt == "Purchases"
            puts Purchase.all
            puts "Now showing current list."
            puts "Which purchase would you like to delete? (enter ID)"
            getPurchaseID = gets.chomp.to_i
            getPurchase = Purchase.find_by(id: getPurchaseID)
            puts "You chose: #{getPurchase} - is this correct?"
            getPurchaseVerify = gets.chomp.capitalize
            if getPurchaseVerify == "Yes"
                puts ". . . Processing . . ."
                getPurchase.destroy
                puts Purchase.all
                puts "Delete Success. Now showing updated Purchase list."
            elsif getPurchaseVerify == "No"
                puts "You chose no"
            end
        elsif getDeletePrompt == "Shareholders"
            puts Shareholder.all
            puts "Now showing current Shareholder list"
            puts "Which shareholder would you like to delete? (enter ID)"
            getShareholderID = gets.chomp.to_i
            getShareholder = Shareholder.find_by(id: getShareholderID)
            puts "You chose #{getShareholder} - is this correct?"
            getShareholderVerify = gets.chomp.capitalize
            if getShareholderVerify == "Yes"
                puts ". . . Processing . . ."
                getShareholder.destroy
                puts Shareholder.all
                puts "Delete Success. Now showing updated Shareholder list"
            elsif getShareholder == "No"
                puts "You chose no"
            end
        elsif getDeletePrompt == "Stocks"
            puts Stock.all
            puts "Now showing current Stock list"
            puts "Which stock would you like to update? (enter ID)"
            getStockID = gets.chomp.to_i
            getStock = Stock.find_by(id: getStockID)
            puts "You chose #{getStock} - is this correct?"
            getStockVerify = gets.chomp.capitalize
            if getStockVerify == "Yes"
                puts ". . . Processing . . ."
                getStock.destroy
                puts Stock.all
                puts "Delete success. Now showing updated Stock list"
            elsif getStockVerify == "No"
                puts "You chose no"
            end
        end
    end

    def endRepeat
        puts "What would you like to do?"
        puts "View  Create  Update  Delete (or exit)"
        user_input = gets.chomp
    end

    def waitForEnter
        puts "\nPress enter to continue"
        gets.chomp
    end

end