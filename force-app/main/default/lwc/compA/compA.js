import { LightningElement } from 'lwc';

export default class CompA extends LightningElement {
    value;

    handleChange(evt){
        this.value = evt.target.value;
    }
}