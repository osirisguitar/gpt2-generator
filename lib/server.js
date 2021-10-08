import Koa from 'koa'
const app = new Koa()
import koaRouter from '@koa/router'
const router = koaRouter()
import bodyParser from 'koa-bodyparser'
import gpt2Service from './services/gpt2Service.js'

const start = () => {
  app.use(bodyParser());

  router.get('/generate', async (ctx) => {
    const initialText = ctx.request.query.text
    const length = ctx.request.query.length
    console.log('length', length)
    const temperature = ctx.request.query.temperature
    const generatedText = await gpt2Service.generateText(initialText, length, temperature)
    ctx.body = generatedText
  })

  app
    .use(router.routes())
    .use(router.allowedMethods());

  app.listen(8866)
  console.log('server started')
}

export default {
  start
}