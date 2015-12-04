import justdevit.DatasetService

class BootStrap {

    DatasetService datasetService

    def init = { servletContext ->
        datasetService.data()
    }
    def destroy = {
    }
}
