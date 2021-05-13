import { LightningElement, wire, track} from 'lwc';
import searchLeads from '@salesforce/apex/LeadSearchController.searchLeads';

const COLS = [
    {
        label: 'Name',
        fieldName: 'Name',
        type: 'text'
    },
    {
        label: 'Phone',
        fieldName: 'Phone',
        type: 'phone'
    },
    {
        label: 'Website',
        fieldName: 'Website',
        type: 'url'
    },
    {
        label: 'View',
        type: 'button-icon',
        initialWidth: 75,
        typeAttributes: {
            title: 'View Details',
            alternativeText: 'View Details',
            iconName: 'action:info'

        }
    }
];

export default class LeadList extends (LightningElement) {
    @track leads = [];
    @track searchTerm;
    @track cols = COLS;
    @track error;

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
        const selectedEvent = new CustomEvent('newsearch', {detail: this.searchTerm});
        this.dispatchEvent(selectedEvent);
    }

    @wire(searchLeads,   {
        searchTerm: '$searchTerm'
    })
    loadLeads(data) {
        if (data) {
            this.leads = data;
            this.error = undefined;
        } else if (error) {
            //handle error
            this.error = error;
            this.leads = undefined;
        }
     }

}
