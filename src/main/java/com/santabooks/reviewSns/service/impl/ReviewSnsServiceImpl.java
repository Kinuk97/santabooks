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

	@Override
	public void remove(ReviewSns reviewSns) {
		
		reviewSnsDao.deleteReview(reviewSns);
	}

	@Override
	public int selectCntAll3(Paging paging) {
		
		return reviewSnsDao.selectCntAll3(paging);
	}

	@Override
	public List<Book> bookList(Paging bookPaging) {
		
		return reviewSnsDao.selectBook(bookPaging);
	}

}
