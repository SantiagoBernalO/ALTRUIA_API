﻿using LogicaDeNegocio;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace proyectoTEA.Controllers
{
	public class ValuesController : ApiController
	{
		// GET api/values
		public IEnumerable<string> Get()
		{
			return new string[] { "value1", "value2" };
		}

		// GET api/values/5
		public string Get(int id)
		{
			return "value";
		}

        [HttpGet]
        [Route("api/validacionDB")]
        public IHttpActionResult validacionDB()
        {
			try
			{
                return Ok(new LActividad().listaEnteros());
            }
            catch (Exception e)
			{
				return BadRequest(e.Message);
			}
        }

        // POST api/values
        public void Post([FromBody]string value)
		{
		}

		// PUT api/values/5
		public void Put(int id, [FromBody]string value)
		{
		}

		// DELETE api/values/5
		public void Delete(int id)
		{
		}
	}
}
