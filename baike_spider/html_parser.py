#coding:utf-8
from bs4  import BeautifulSoup
import re
import urlparse
import requests
class HtmlParser(object):
    
    
    def _get_new_urls(self, page_url, soup):
        new_urls = set()
        links = soup.find_all('a' , href=re.compile(r"//book.qidian.com/info/\d+"))
        for link in links:
            new_url = link['href'] 
            new_full_url = urlparse.urljoin(page_url,new_url)
            new_urls.add(new_full_url)  
        return new_urls    
    
    
    def _get_score_url(self,page_url):
        #"http://book.qidian.com/info/1004608738"
        #http://book.qidian.com/ajax/comment/index?_csrfToken=hRMAi3nDUU6l7ZJo3hOcTeqXlFOcgJI8ZzGepfcq&bookId=20117
        url=None
        try:
            url="http://book.qidian.com/ajax/comment/index?_csrfToken=hRMAi3nDUU6l7ZJo3hOcTeqXlFOcgJI8ZzGepfcq&bookId="
            id=re.search('info/(\d+)', page_url, re.S).group(1)
            url=url+id
        except:  
            return None  
        return url
    
    def _get_new_data(self, page_url, soup):
        res_data = {}
        score = 0
        res_data['url'] = page_url
        #<dd class="lemmaWgt-lemmaTitle-title">
        title_node = soup.find('div',class_="book-info").find("h1").find("em")
        res_data['title'] = title_node.get_text()
        
        summary_node = soup.find('p',class_="intro")
        res_data['summary'] = summary_node.get_text()
        #获取getURL
        score_url=self._get_score_url(page_url)
        res_data['score']=0
        if score_url is not None:
                    score_cont = requests.get(score_url,timeout=0.5)
                    try:
                       score=re.search('rate":(.*?),', score_cont.text, re.S).group(1)
                    except:
                        score=0   
        
        res_data['score']=score
        
        return res_data
             
    
    def parse(self,page_url,html_cont):
        if page_url is None or html_cont is None:
            return 
        soup = BeautifulSoup(html_cont,'html.parser')
        new_urls = self._get_new_urls(page_url,soup)
        new_data = self._get_new_data(page_url,soup)
        return new_urls,new_data
    
    



