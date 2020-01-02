package com.santabooks.reviewSns.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import com.santabooks.member.dto.Member;
import com.santabooks.reviewSns.dao.face.ReviewSnsDao;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.reviewSns.dto.Grade;
import com.santabooks.reviewSns.dto.NaverBook;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.reviewSns.service.face.ReviewSnsService;
import com.santabooks.util.Paging;

@Service
public class ReviewSnsServiceImpl implements ReviewSnsService{
	
	@Autowired ReviewSnsDao reviewSnsDao;
	
	private static String clientID = "a6C_zuZh1tiuJZOJbVAy";
	private static String clientSecret = "JRaHbpGPrW";
	
	@Override
	public int selectCntAll(Paging paging) {
		
		return reviewSnsDao.selectCntAll(paging);
	}

	@Override
	public List<ReviewSns> snsList(Paging reviewPaging) {
		
		return reviewSnsDao.selectAll(reviewPaging);
	}

	@Override
	public ReviewSns view(ReviewSns reviewSns) {
		
		return reviewSnsDao.selectReviewByFeedNo(reviewSns);
	}
	
	@Override
	public List<NaverBook> searchBook(String keyword, int display, int start) {
		 List<NaverBook> list = null;
	        try {
	            URL url;
	            url = new URL("https://openapi.naver.com/v1/search/"
	                    + "book.xml?query="
	                    + URLEncoder.encode(keyword, "UTF-8")
	                    + (display !=0 ? "&display=" +display :"")
	                    + (start !=0 ? "&start=" +start :""));
	            
	            URLConnection urlConn = url.openConnection();
	            urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
	            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            
	            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
	            XmlPullParser parser = factory.newPullParser();
	            parser.setInput(
	                    new InputStreamReader(urlConn.getInputStream()));
	                        
	            int eventType = parser.getEventType();
	            NaverBook b = null;
	            while (eventType != XmlPullParser.END_DOCUMENT) {
	                switch (eventType) {
	                case XmlPullParser.END_DOCUMENT: // 문서의 끝
	                    break;
	                case XmlPullParser.START_DOCUMENT:
	                    list = new ArrayList<NaverBook>();
	                    break;
	                case XmlPullParser.END_TAG: {
	                    String tag = parser.getName();
	                    if(tag.equals("item"))
	                    {
	                        list.add(b);
	                        b = null;
	                    }
	                }
	                case XmlPullParser.START_TAG: {
	                    String tag = parser.getName();
	                    switch (tag) {
	                    case "item":
	                        b = new NaverBook();
	                        break;
	                    case "title":
	                        if(b != null)
	                            b.setTitle(parser.nextText());
	                        break;
	                    case "link":
	                        if(b != null)
	                            b.setLink(parser.nextText());
	                        break;
	                    case "image":
	                        if(b != null)
	                            b.setImage(parser.nextText());
	                        break;
	                    case "author":
	                        if(b != null)
	                            b.setAuthor(parser.nextText());
	                        break;
	                    case "price":
	                        if(b != null)
	                            b.setPrice(parser.nextText());
	                        break;
	                    case "discount":
	                        if(b != null)
	                            b.setDiscount(parser.nextText());
	                        break;
	                    case "publisher":
	                        if(b != null)
	                            b.setPublisher(parser.nextText());
	                        break;
	                    case "pubdate":
	                        if(b != null)
	                            b.setPubdate(parser.nextText());
	                        break;
	                    case "isbn":
	                        if(b != null)
	                            b.setIsbn(parser.nextText());
	                        break;
	                    case "description":
	                        if(b != null)
	                            b.setDescription(parser.nextText());
	                        break;
	                    }
	                    
	                }
	                }
	                eventType = parser.next();
	            } 
	            
	        } catch (MalformedURLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (XmlPullParserException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        return list;

	}

	@Override
	public List<ReviewSns> snsListInBook(ReviewSns review) {
		
		return reviewSnsDao.selectReviewByBookNo(review);
	}

	@Override
	public List<ReviewSns> reviewList(Paging reviewPaging) {
		
		return reviewSnsDao.selectAllByBookNo(reviewPaging);
	}

	@Override
	public ReviewSns detailView(ReviewSns reviewSns) {

		return reviewSnsDao.selectDetailReviewByFeedNo(reviewSns);
	}

	@Override
	public void write(ReviewSns reviewSns) {
		
		reviewSnsDao.insert(reviewSns);
		
	}

	@Override
	public void addGrade(Grade grade) {
		
		reviewSnsDao.insertGrade(grade);
		
	}

	@Override
	public Book getBook(int bookNo) {
		
		return reviewSnsDao.selectBookByBookNo(bookNo);
	}

	@Override
	public Member getMember(Member member) {
		
		return reviewSnsDao.selectMemberByMemberNo(member);
	}

	@Override
	public int selectCntAll2(Paging paging) {
		
		return reviewSnsDao.selectCntAll2(paging);
	}
	
//	@Override
//	   public String geturl(String numOfRows) {
//	      
//	      
//	      String url= "http://data.ulsan.go.kr/rest/ulsanbooulsanbooksks/getUlsanbooksList?";
//	      url += "authApiKey=xt2lcxKJD81UXkvlTIQlPE7fH5kFYdg21OkxYW6bbJxXEz1AMe212NBZbm6xHbqu45NjmHnmg4OwIQdF26I%2F8w%3D%3D&";
//	      url += "numOfRows="+numOfRows;
//	      
//	      System.out.println(url);
//	      URL link = null;
//	         try {
//	            link = new URL(url);
//	         } catch (MalformedURLException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	         }
//	         try {
//	            HttpURLConnection con = (HttpURLConnection)link.openConnection();
//	            con.setRequestMethod("GET");
//	            con.setRequestProperty("accept-language", "ko-KR");
//	            
//	            StringBuilder sb = new StringBuilder();
//	            if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
//	               BufferedReader br = new BufferedReader(
//	                     new InputStreamReader(con.getInputStream(), "utf-8"));
//	               String line;
//	               while ((line = br.readLine()) != null) {
//	                  sb.append(line).append("\n");
//	               }
//	               br.close();
//	            } else {
//	               System.out.println(con.getResponseMessage());
//	            }
//	            return sb.toString();
//	            
//	         } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	         }
//	         
//
//	      return "";
//	      
//	   }
	
//	public void insertholiday(String url) {
//	      // TODO Auto-generated method stub
//	      
//	      List<Book> bookList = new ArrayList<Book>();
//	      
//	      //DocumentBuilderFactory 생성
//	        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
//	        factory.setNamespaceAware(true);
//	        DocumentBuilder builder;
//	        Document doc = null;
//	        try {
//	            // xml 파싱하기
//	            String result =url; 
//	            InputSource is = new InputSource(new StringReader(result));
//	            builder = factory.newDocumentBuilder();
//	            doc = builder.parse(is);
//	            XPathFactory xpathFactory = XPathFactory.newInstance();
//	            XPath xpath = xpathFactory.newXPath();
//	            // XPathExpression expr = xpath.compile("/response/body/items/item");
//	            XPathExpression expr = xpath.compile("/data/list");
//	            NodeList nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
//	            for (int i = 0; i < nodeList.getLength(); i++) {
//	                NodeList child = nodeList.item(i).getChildNodes();
//	                for (int j = 0; j < child.getLength(); j++) {
//	                    Node node = child.item(j);
//	                    System.out.println("현재 노드 이름 : " + node.getNodeName());
//	                    String name = node.getNodeName();
//	                    System.out.println(name); 
//	                    System.out.println("현재 노드 값 : " + node.getTextContent());
//	                    node.
//	                    
//	                   
//	                    if(name =="dateName") {
//	                       nameList.add(node.getTextContent());
//	                       
//	                       
//	                    }
//	                    
//	                    if(name=="locdate") {
//	                       LocalDate holiday_date=LocalDate.parse(node.getTextContent(),DateTimeFormatter.BASIC_ISO_DATE);
//	                       
//	                       dateList.add(holiday_date);
//	                    }
//	                    
//	                  
//	                    
//	                   
//	                    
//	                }
//	            }
//	        } catch (Exception e) {
//	            System.out.println(e.getMessage());
//	        }
//	        
//
//	        for (int i = 0; i < nameList.size(); i++) {
//	         Holiday holiday = new Holiday();
//	         
//	         holiday.setHoliday_name(nameList.get(i));
//	         holiday.setHoliday_date(dateList.get(i));
//	         
//	         
//	           calendarDao.deleteholiday(holiday);
//	         calendarDao.insertholiday(holiday);
//	      }
//	           
//	   }

}
