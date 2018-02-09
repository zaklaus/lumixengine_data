local preview_pipeline = nil

function initPostprocess(pipeline, env)
    preview_pipeline = Renderer.createPipeline(g_engine, "pipelines/main.lua")
    Renderer.setPipelineScene(preview_pipeline, g_scene_renderer)
end

function postprocess(pipeline, env)
    if preview_pipeline == nil then return end

    local w = getWidth(preview_pipeline)
    local h = getHeight(preview_pipeline)

    local preview = Renderer.getRenderBuffer(preview_pipeline, "default", 0)
    Renderer.pipelineRender(preview_pipeline, w, h)

    newView(pipeline, "camera_preview", "default")
        setPass(pipeline, "MAIN")
        disableBlending(pipeline)
        disableDepthWrite(pipeline)
        bindFramebufferTexture(pipeline, "default", 0, env.texture_uniform)
        drawQuad(pipeline, 0, 0, 0.25, 0.25, env.screen_space_material)
end

function onDestroy()
    if preview_pipeline == nil then return end

    Renderer.destroyPipeline(preview_pipeline)
    preview_pipeline = nil
end