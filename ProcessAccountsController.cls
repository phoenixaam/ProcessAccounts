public class ProcessAccountsController {

    public Boolean isShowProcess {get; set;}
    public List<Account> selectedAccounts {get; set;}
    public List<aAccount> accountList {get; set;}
    
    public ProcessAccountsController(){
        isShowProcess = false;
        selectedAccounts = new List<Account>();
        accountList = new List<aAccount>();
        for(Account a: [select Id, Name, Phone from Account limit 30]) {
            accountList.add(new aAccount(a));
        }
    }
    
    public List<aAccount> getAAccounts() {
        return accountList;
    }
    
    public PageReference processSelected() {
        selectedAccounts = new List<Account>();
        for(aAccount aAcc: accountList) {
            if(aAcc.selected == true) {
                selectedAccounts.add(aAcc.acc);
            }
        }

        isShowProcess = true;
        return null;
    }

    public class aAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
        
        public aAccount(Account a) {
            acc = a;
            selected = false;
        }
    }

}