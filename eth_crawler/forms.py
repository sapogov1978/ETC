from django import forms

class FirstRequest(forms.Form):
    wallet = forms.CharField()
    st_block = forms.IntegerField()