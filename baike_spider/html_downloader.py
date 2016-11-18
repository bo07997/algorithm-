#coding:utf-8
import requests

class HtmlDownloader(object):
    
    
    def download(self,url):
        if url is None:
            return
        response = requests.get(url,timeout=0.5)
         
        if response.status_code !=200:
            return None
         
        return response
    
    



