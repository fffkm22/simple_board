package nspr.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nspr.config.MyBatisConnectionProvider;
import nspr.model.Post;

@Controller
public class ViewController {

	@GetMapping("/view")
	public String view(@RequestParam(name = "no") int no, HttpServletRequest req, HttpServletResponse res) {
		try {
			SqlSession session = MyBatisConnectionProvider.getSession();
			Post post = session.selectOne("nspr.mapper.PostMapper.selectPostByNum", no);
			post.hitsIncrease();
			session.update("nspr.mapper.PostMapper.updateHits", post);
			session.commit();
			req.setAttribute("post", post);
			session.close();

			return "view";
		} catch (Exception e) {
			return "error";
		}
	}
}
