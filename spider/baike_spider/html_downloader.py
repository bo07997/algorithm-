#coding:utf8
import urllib2

class HtmlDownloader(object):
    
    
    def download(self,url):
        if url is None:
            return
        response = urllib2.urlopen(url,timeout=0.5)
         
        if response.getcode() !=200:
            return None
         
        return response.read()
    
    



